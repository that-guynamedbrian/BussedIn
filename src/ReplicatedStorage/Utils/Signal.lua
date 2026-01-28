--!strict
-- Types
-- -- Receiver type
-- -- -- private
type _Receiver = Receiver & {
    _next: _Receiver;
    _prev: _Receiver | _Signal;
    _func: (...any)->();
    _catch: (errorMessage:string, ...any)->();
    _call: (self:_Receiver, ...any)->();
};
-- -- public
export type Receiver = {
    Type: "Receiver";
    Disconnect: (self:_Receiver|any)->();

    Catch: (self:Receiver|any, errorhandler:(errorMessage:string, ...any)->())->(Receiver);
};

-- -- Signal type
-- -- -- private
type _Signal = Signal & {
    _next: _Receiver;
    _prev: _Receiver | _Signal;
};
-- -- -- public
export type Signal = {
    Type: "Signal";
    Destroy: (self:_Signal|any)->();

    Fire: (self:_Signal|any, ...any)->();
    Connect: (self:_Signal|any, callback:(...any)->(...any))->(Receiver);
    Once: (self:_Signal|any, callback:(...any)->(...any))->(Receiver);
    Wait: (self:_Receiver|any)->(...any);
};

local Signal = {}::_Signal&{[any]:any};
local Receiver = {}::_Receiver&{[any]:any};
Signal.__index = Signal;
Receiver.__index = Receiver;


-- Functions
-- -- Receiver
-- -- -- private
function Receiver:_call(...)
    local success, errorMessage = pcall(self._func, ...) :: boolean, typeof"";
    if not success then
        if self._catch then
            self._catch(errorMessage, ...);
        else
            error(errorMessage)
        end
    end
end

-- -- -- public
function Receiver:Catch(errorhandler)
    assert(self._catch == nil, "error handler function already attached to receiver");
    assert(typeof(errorhandler) == "function", "error handler must be a function");
    (self::any)._catch = errorhandler;
    return self;
end;

function Receiver:Disconnect()
    local nextReceiver, prevReceiver = self._next, self._prev
    if nextReceiver then 
        nextReceiver._prev = prevReceiver;
    end
    prevReceiver._next = nextReceiver;
    table.clear(self);
end;

-- -- Signal
-- -- -- public
function Signal:Fire(...)
    local receiver = self._next;
    while receiver ~= nil do
        receiver:_call(...);
        receiver = receiver._next;
    end
end;

function Signal:Connect(callback)
    assert(typeof(callback) == "function", "callback must be a function");
    local nextReceiver = self._next
    local receiver = {
        Type = "Receiver";
        _next = nextReceiver;
        _prev = self;
        _func = callback;
    };
    if nextReceiver ~= nil then
        nextReceiver._prev = receiver;
    end
    (self::any)._next = receiver;
    return setmetatable(receiver, Receiver)::any
end;

function Signal:Once(callback)
    assert(typeof(callback) == "function", "callback must be a function");
    local receiver:Receiver;
    receiver = self:Connect(function(...)
        callback(...);
        receiver:Disconnect();
    end);
    return receiver;
end;

function Signal:Wait()
    local co = coroutine.running();
    self:Once(function(...)
        coroutine.resume(co, ...);
    end);
    return coroutine.yield();
end

function Signal:Destroy()
    local receiver = self._next;
    while receiver ~= nil do
        local temp = receiver._next
        receiver:Disconnect();
        receiver = temp;
    end
    table.clear(self);
end

-- Return Constructor
function Signal.new(self, ...):Signal
    self = {
        Type = "Signal";
    }::any;
    self._next = nil;
    self._prev = nil;
    return setmetatable(self, Signal)::any;
end

return Signal :: {new:()->Signal}