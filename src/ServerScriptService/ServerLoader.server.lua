local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local ReplicaServer = require(script.Parent.ReplicaServer)
local Character = require(ServerStorage.AyoFramework.AyoTypes.Character)

Players.PlayerAdded:Connect(function(player)
    local characterInstance = player.Character or player.CharacterAdded:Wait();
    local char = Character.new(characterInstance);
    local charReplica = ReplicaServer.New({
        Token = ReplicaServer.Token("LocalCharacterAyo");
        Data = char;
    })
    char.Changed:Connect(function(value)
        charReplica:Set({})
    end)
    local _unitKey, tool = next(char.Inventory)
    char:Equip(tool)
end)