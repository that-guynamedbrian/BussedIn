local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
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
Character.PLACEMENT_RANGE = 100;
Character.MAX_CAM_DISTANCE = 130;

local characters_cache = {}

function Character:AddToBackpack(toPickup:Types.PickupableAyo)
    toPickup:Pickup(self);
end

function Character:RemoveFromBackpack(toRemove:Types.PickupableAyo)
    toRemove:Remove(self);
end

function Character:AddToInventory(toAdd:Types.PickupableAyo)
    local instance = toAdd.Instance
    instance.Parent = self.Inventory
end

function Character:RemoveFromInventory(toRemove:Types.PickupableAyo)
    self:AddToBackpack(toRemove)
end



function Character:Equip(toEquip:Types.ToolAyo)
    toEquip:Equip(self)
end

function Character:Unequip()
    local tool = self.InHand
    tool:Unequip(self)
end;



function Character:Place(toPlace:Types.PlaceableAyo, start:Vector3, direction:Vector3)
    return toPlace:Place(start, direction);
end


function Character.new(rootinstance:Model)
    local player = Players:GetPlayerFromCharacter(rootinstance)
    local char_ayoKey = player and player.UserId or rootinstance:GetAttribute("ayoKey")
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
        for i = 1, template:GetAttribute("count") or 5 do
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
        for i = 1, template:GetAttribute("count") or 5 do
            local newplaceable = Placeable.new(ayoKey)
            newplaceable.Instance.Parent = subfolder;
            newplaceable.Instance.Name = newplaceable.UnitKey;
        end
    end

    local self:Types.CharacterAyo = {
        AyoType = player and "Player";
        PlayerObject = player; -- if player doesn't exist, PlayerObject is not set
        Name = rootinstance.Name;
        AyoKey = char_ayoKey;
        UnitKey = unitKey;
        Instance = rootinstance;
        Backpack = backpack;
        Inventory = inventory;
        Changed = Signal.new();
    };

    rootinstance:SetAttribute("ayoType", player and "Player" or Character.AyoType)
    rootinstance:SetAttribute("unitKey", self.UnitKey);
    rootinstance:SetAttribute("name", rootinstance.Name);
    characters_cache[unitKey] = self
    return setmetatable(self, Character);
end

function Character.fromUnitKey(unitKey:string)
    return characters_cache[unitKey];
end

return Character :: {
    new: (rootinstance:Model)->Types.CharacterAyo;
    fromUnitKey: (unitKey:string)->Types.CharacterAyo;
    PLACEMENT_RANGE:number;
    MAX_CAM_DISTANCE:number;
};