local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local Signal = require(ReplicatedStorage.Utils.Signal)
local remoteEvent = script:FindFirstChildOfClass("RemoteEvent");
local remoteFunc = script:FindFirstAncestorOfClass("RemoteFunction");

local clientEvent = remoteEvent.OnClientEvent;
local serverEvent = remoteEvent.OnServerEvent;

local function HandleInvocation(portId:string, ...:any)
    
end

local Net = {};
local Ports = {};

function Net.Await(portId:string)
    Ports[portId] = Ports[portId] or Signal.new();
    return Ports[portId]:Await()
end

function Net.ConnectToPort(portId:string, callback:(...any)->())
    Ports[portId] = Ports[portId] or Signal.new();
    Ports[portId]:Receive(callback);
end

function Net.Send(portId:string, ...:any)
    if RunService:IsClient() then
        remoteEvent:FireServer(...);
    else
        remoteEvent:FireClient(...);
    end
end

function Net.Request(portId:string, ...:any)
    
end

return Net;