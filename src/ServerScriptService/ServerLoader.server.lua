local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local ReplicaServer = require(script.Parent.ReplicaServer)
local Character = require(ServerStorage.AyoFramework.AyoTypes.Character)

Players.PlayerAdded:Connect(function(player)
    local characterInstance = player.Character or player.CharacterAdded:Wait();
    local char = Character.new(characterInstance);
    local shallow = table.clone(char)
    setmetatable(shallow, nil)
    for key, value in shallow do
        if typeof(value) == "table" then
            shallow[key] = nil
        end
    end
    local charReplica = ReplicaServer.New({
        Token = ReplicaServer.Token("LocalCharacterAyo");
        Data = shallow;
    })
    charReplica:Replicate()
    char.Changed:Connect(function(index:string)
        charReplica:Set({index}, char[index]);
    end)
end)