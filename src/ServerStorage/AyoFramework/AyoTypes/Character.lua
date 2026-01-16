local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")

local Signal = require(ReplicatedStorage.Utils.Signal)
local Placeable = require(script.Parent.Placeable)
local Tool = require(script.Parent.Tool)
local AvailableItems = require(ServerScriptService.AyoFramework.AvailableItems)
local Types = require(ServerStorage.AyoFramework.Types)


local Character = {
    AyoType = "Character";
} :: Types.CharacterAyo;
Character.__index = Character;
Character.__newindex = function(self:Types.CharacterAyo, index, value)
    rawset(self, index, value)
    self.Changed:Fire(self[index]);
end

function Character:AddToBackpack(toPickup:Types.PickupableAyo)
    toPickup:Pickup(self);
end

function Character:RemoveFromBackpack(toRemove:Types.PickupableAyo)
    toRemove:Remove(self)
end

function Character:Equip(toEquip:Types.ToolAyo)
    local hum = self.Instance:FindFirstChildOfClass("Humanoid");
    hum:EquipTool(toEquip.Instance);
end

function Character:Unequip()
    local hum = self.Instance:FindFirstChildOfClass("Humanoid");
    hum:UnequipTools();
end;

function Character.new(instance:Model)
    
    local inventory = {}
    for ayoKey, template in AvailableItems.Tools do
        if template:GetAttribute("earnedItem") or template:GetAttribute("purchaseAmount") then
            continue;
        end
        local newtool = Tool.new(ayoKey);
        inventory[newtool.UnitKey] = newtool;
    end
    
    for ayoKey, template in AvailableItems.Placeables do
        if template:GetAttribute("earnedItem") or template:GetAttribute("purchaseAmount") then
            continue;
        end
        local newplaceable = Placeable.new(ayoKey);
        inventory[newplaceable.UnitKey] = newplaceable;
    end

    local self = {
        Instance = instance;
        Inventory = inventory;
        Changed = Signal.new();
    };

    return setmetatable(self, Character);
end

return Character :: {
    new: (instance:Model)->Types.CharacterAyo
};