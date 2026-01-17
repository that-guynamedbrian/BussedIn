local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local backpackFolder = ReplicatedStorage.AyoFramework.BackpackFolder
local inventoryFolder = ReplicatedStorage.AyoFramework.InventoryFolder

local Placeable = require(script.Parent.Placeable)
local Tool = require(script.Parent.Tool)
local Types = require(ReplicatedStorage.AyoFramework.Types)
local Signal = require(ReplicatedStorage.Utils.Signal)
local AvailableItems = require(ServerScriptService.AyoFramework.AvailableItems)

local Character = {
    AyoType = "Character";
} :: Types.CharacterAyo;
Character.__index = Character;
Character.__newindex = function(self:Types.CharacterAyo, index, value)
    rawset(self, index, value)
    self.Changed:Fire(index);
end

function Character:AddToBackpack(toPickup:Types.PickupableAyo)
    toPickup:Pickup(self);
end

function Character:RemoveFromBackpack(toRemove:Types.PickupableAyo)
    toRemove:Remove(self);
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
    local unitKey = HttpService:GenerateGUID(false)
    local backpack = Instance.new("Folder")
    backpack.Name = unitKey
    backpack.Parent = backpackFolder
    local inventory = Instance.new("Folder")
    inventory.Name = unitKey
    inventory.Parent = inventoryFolder

    for ayoKey, template in AvailableItems.Tools do
        local subfolder = Instance.new("Folder")
        subfolder.Name = ayoKey
        subfolder.Parent = backpack
        if template:GetAttribute("earnedItem") or template:GetAttribute("purchaseAmount") then
            continue;
        end;
        for i = 1, template:GetAttribute("count") or 1 do
            local newtool = Tool.new(ayoKey);
            newtool.Instance.Parent = subfolder;
            newtool.Instance.Name = newtool.UnitKey;
        end
    end
    
    for ayoKey, template in AvailableItems.Placeables do
        local subfolder = Instance.new("Folder")
        subfolder.Name = ayoKey
        subfolder.Parent = backpack
        if template:GetAttribute("earnedItem") or template:GetAttribute("purchaseAmount") then
            continue;
        end
        for i = 1, template:GetAttribute("count") or 1 do
            local newplaceable = Placeable.new(ayoKey)
            newplaceable.Instance.Parent = subfolder;
            newplaceable.Instance.Name = newplaceable.UnitKey;
        end
    end

    local self = {
        Name = instance.Name;
        UnitKey = unitKey;
        Instance = instance;
        Backpack = backpack;
        Inventory = {};
        Changed = Signal.new();
    };

    instance:SetAttribute("unitKey", self.UnitKey);
    instance:SetAttribute("name", instance.Name);

    return setmetatable(self, Character);
end

return Character :: {
    new: (instance:Model)->Types.CharacterAyo
};