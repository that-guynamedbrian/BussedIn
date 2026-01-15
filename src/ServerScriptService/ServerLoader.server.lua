local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local Character = require(ServerStorage.AyoFramework.AyoTypes.Character)

Players.PlayerAdded:Connect(function(player)
    local characterInstance = player.Character or player.CharacterAdded:Wait();
    local char = Character.new(characterInstance);
    local _unitKey, tool = next(char.Inventory)
    char:Equip(tool)
end)