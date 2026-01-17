local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RootUI = require(script.Parent.RootUI)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local ReplicaClient = require(ReplicatedStorage.ReplicaClient)

local co = coroutine.running()
ReplicaClient.OnNew("LocalCharacterAyo", function(replica: ReplicaClient.Replica)
    print(replica)
    coroutine.resume(co, replica)
end)
ReplicaClient.RequestData()
local backpackReplica:ReplicaClient.Replica = coroutine.yield()
print(backpackReplica)

local story = {
    react = React;
    reactRoblox = ReactRoblox;
    story = function(props)
        return React.createElement(RootUI, {
            backpackReplica = backpackReplica
        })
    end;
}

return story