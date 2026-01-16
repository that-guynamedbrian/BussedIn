
-- Types
-- -- Receiver type
-- -- -- private
type _Receiver = Receiver & {
    _next: _Receiver | _Signal;
    _prev: _Receiver | _Signal;
    _func: (...any)->();
    _catch: (errorMessage:string, ...any)->();
    _call: (self:_Receiver, ...any)->();
};
-- -- public
export type Receiver = {
    Type: "Receiver";
    Disconnect: (self:_Receiver|any)->();

    Catch: (self:_Receiver|any, errorhandler:(errorMessage:string, ...any)->())->(Receiver);
};

-- -- Signal type
-- -- -- private
type _Signal = Signal & {
    _next: _Receiver | _Signal;
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
    local success, errorMessage = pcall(self._func, ...);
    if self._catch and not success then
        self._catch(errorMessage, ...);
    end
end

-- -- -- public
function Receiver:Catch(errorhandler)
    assert(self._catch == nil, "error handler function already attached to receiver");
    self._catch = errorhandler;
    return self;
end;

function Receiver:Disconnect()
    self._next._prev = self._prev;
    self._prev._next = self._next;
    table.clear(self);
end;

-- -- Signal
-- -- -- public
function Signal:Fire(...)
    local receiver = self._next;
    while receiver ~= self do
        receiver:_call(...);
        receiver = self._next;
    end
end;

function Signal:Connect(callback)
    assert(typeof(callback) == "function", "callback must be a function");
    local receiver = {
        Type = "Receiver";
        _next = self._next;
        _prev = self;
        _func = callback;
    };
    (self._next::any)._prev = receiver::any;
    self._next = receiver::any;
    return setmetatable(receiver, Receiver)::any
end;

function Signal:Once(callback)
    assert(typeof(callback) == "function", "callback must be a function");
    local receiver;
    receiver = self:Receive(function(...)
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
    while receiver ~= self do
        receiver:Disconnect();
        receiver = self._next;
    end
    table.clear(self);
end

-- Return Constructor
function Signal.new(self, ...):Signal
    self = {
        Type = "Signal";
    }::any;
    self._next = self;
    self._prev = self;
    return setmetatable(self, Signal);
end

return Signal :: {new:()->Signal}