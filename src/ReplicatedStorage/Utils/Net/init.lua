local ReplicatedStorage = game:GetService("ReplicatedStorage");
local RunService = game:GetService("RunService");

local Signal = require(ReplicatedStorage.Utils.Signal);



local unreliableRemoteEvent = script:FindFirstChildOfClass("UnreliableRemoteEvent");
local remoteEvent = script:FindFirstChildOfClass("RemoteEvent");
local remoteFunc = script:FindFirstChildOfClass("RemoteFunction");

local Net = {};
local Ports = {} :: {Signal.Signal};
local Callbacks = {} :: {(...any)->(...any)};



local function HandleRemoteFired(...:any)
    local args = {...};
    local portId = if RunService:IsClient() then table.remove(args,1) else table.remove(args,2);

    assert(typeof(portId) == "string", "Invalid port id");
    local port = Ports[portId];
    if port then
        port:Fire(unpack(args));
    else
        warn(`No receiver subscribed to port [{portId}]`);
    end
end

local function HandleInvocation(portId:string, ...:any)
    if Callbacks[portId] then
        return Callbacks[portId](...);
    end
    return warn(`No callback subscribed to port [{portId}]`)
end




function Net.Wait(portId:string): ...any
    Ports[portId] = Ports[portId] or Signal.new();
    return Ports[portId]:Wait()
end

function Net.Connect(portId:string, callback:(...any)->()): Signal.Receiver
    Ports[portId] = Ports[portId] or Signal.new();
    return Ports[portId]:Connect(callback);
end

function Net.HandleRequest(portId:string, callback:(...any)->(...any)): ()
    assert(typeof(callback) == "function", "Callback to connect must be a function");
    if Callbacks[portId] then
        warn(`Warning: Overwrote port [{portId}] callback`)
    end
    Callbacks[portId] = callback;
end




-- player, portid, args
function Net.SendAsync(...): ()
    if RunService:IsClient() then
        remoteEvent:FireServer(...);
    else
        remoteEvent:FireClient(...);
    end
end

-- player, portid, args
function Net.SendUnsafeAsync(...): ()
    if RunService:IsClient() then
        unreliableRemoteEvent:FireServer(...);
    else
        unreliableRemoteEvent:FireClient(...);
    end
end

-- player, portid, args
function Net.Request(timeout:number, ...:any): ...any
    local args = nil;
    local t0 = os.clock();
    args =  {
        coroutine.wrap(function(...)
            coroutine.yield(remoteFunc:InvokeServer(...));
        end)(...);
    }
    while timeout > os.clock() - t0 do
        if args then 
            return unpack(args);
        end
        task.wait();
    end
    return nil;
end



if RunService:IsClient() then
    remoteFunc.OnClientInvoke = HandleInvocation;
    remoteEvent.OnClientEvent:Connect(HandleRemoteFired);
    unreliableRemoteEvent.OnClientEvent:Connect(HandleRemoteFired);
else
    remoteFunc.OnServerInvoke = HandleInvocation;
    remoteEvent.OnServerEvent:Connect(HandleRemoteFired);
    unreliableRemoteEvent.OnServerEvent:Connect(HandleRemoteFired);
end

return Net;