local Players = game:GetService("Players")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")

local AvailableItems = require(ServerScriptService.AyoFramework.AvailableItems)
local ReplicaServer = require(script.Parent.ReplicaServer)
local Character = require(ServerStorage.AyoFramework.AyoTypes.Character)
local Tool = require(ServerStorage.AyoFramework.AyoTypes.Tool)

Players.PlayerAdded:Connect(function(player)
    local characterInstance = player.Character or player.CharacterAdded:Wait();
    local char = Character.new(characterInstance);
    for ayoKey, tool in AvailableItems.Tools do
        char:AddToBackpack(Tool.new(ayoKey))
    end
    local charReplica = ReplicaServer.New({
        Token = ReplicaServer.Token("LocalCharacterAyo");
        Data = char.Backpack;
    })
    charReplica:Replicate()
    --[[
    char.Changed:Connect(function(index:string)
        charReplica:Set({index}, char[index]);
    end)
    ]]
    local _unitKey, tool = next(char.Backpack)
    char:Equip(tool)
end)