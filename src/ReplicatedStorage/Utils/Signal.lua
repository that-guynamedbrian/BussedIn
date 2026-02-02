--!strict
-- Types
-- -- Receiver type
-- -- -- private
type _Receiver = Receiver & {
    _next: _Receiver;
    _prev: _Receiver | _Signal;
    _func: (...any)->();
    _call: (self:_Receiver, ...any)->();
};
-- -- public
export type Receiver = {
    Type: "Receiver";
    Disconnect: (self:_Receiver|any)->();
};

-- -- Signal type
-- -- -- private
type _Signal = Signal & {
    _next: _Receiver;
};
-- -- -- public
export type Signal = {
    Type: "Signal";
    Destroy: (self:_Signal|any)->();

    Fire: (self:_Signal|any, ...any)->();
    Connect: (self:_Signal|any, callback:(...any)->(...any))->(Receiver);
    DisconnectAll: (self:_Signal|any)->();
    Once: (self:_Signal|any, callback:(...any)->(...any))->(Receiver);
    Wait: (self:_Receiver|any)->(...any);
};

local Signal = {}::_Signal&{[any]:any};
local Receiver = {}::_Receiver&{[any]:any};
Signal.__index = Signal;
Receiver.__index = Receiver;

local coroutines = {};

-- Functions
-- -- Receiver
-- -- -- private
function Receiver:_call(...)
    if #coroutines == 0 then
        local co = coroutine.create(function(func, ...)
            while true do
                func(...);
                coroutine.yield();
            end
        end);
        coroutine.resume(co);
        table.insert(coroutines, co);
    else
        local co = table.remove(coroutines)::thread;
        coroutine.resume(co,...);
        table.insert(coroutines, co);
    end
end

-- -- -- public
function Receiver:Disconnect()
    local nextReceiver, prevReceiver = self._next, self._prev;
    if nextReceiver then 
        nextReceiver._prev = prevReceiver;
    end
    prevReceiver._next = nextReceiver;
    table.clear(self);
end

-- -- Signal
-- -- -- public
function Signal:Fire(...)
    local receiver = self._next;
    while receiver ~= nil do
        receiver:_call(...);
        receiver = receiver._next;
    end
end

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
end

function Signal:DisconnectAll()
    local receiver = self._next;
    while receiver ~= nil do
        local temp = receiver._next;
        table.clear(receiver);
        receiver = temp;
    end
    (self::any)._next = nil;
end

function Signal:Once(callback)
    assert(typeof(callback) == "function", "callback must be a function");
    local receiver:Receiver;
    receiver = self:Connect(function(...)
        receiver:Disconnect()
        callback(...);
    end);
    return receiver;
end

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
        local temp = receiver._next;
        table.clear(receiver);
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
    return setmetatable(self, Signal)::any;
end

return Signal :: {new:()->Signal};
