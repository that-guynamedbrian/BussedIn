local ServerScriptService = game:GetService("ServerScriptService")
local ServerStorage = game:GetService("ServerStorage")

local Placeable = require(script.Parent.Placeable)
local Tool = require(script.Parent.Tool)
local AvailableItems = require(ServerScriptService.AyoFramework.AvailableItems)
local Types = require(ServerStorage.AyoFramework.Types)
local Character = {}::Types.CharacterAyo

local staticFields = {
    AyoType = "Character";
    InHand = nil;
    Equip = function(self:Types.CharacterAyo, toEquip:Types.PickupableAyo)
        local hum = self.Instance:FindFirstChildOfClass("Humanoid");
        hum:EquipTool(toEquip.Instance);
    end;
    Unequip = function(self:Types.CharacterAyo)
        local hum = self.Instance:FindFirstChildOfClass("Humanoid");
        hum:UnequipTools();
    end;
}::Types.CharacterAyo;

function Character.new(instance:Model)
    local inventory = {}
    
    for ayoKey, _ in AvailableItems.Tools do
        local newtool = Tool.new(ayoKey);
        inventory[newtool.UnitKey] = newtool;
    end

    --[[
    for ayoKey, _ in AvailableItems.Placeables do
        local newplaceable = Placeable.new(ayoKey);
        inventory[newplaceable.UnitKey] = newplaceable;
    end
    ]]

    local self = {
        Instance = instance;
        Inventory = inventory;
    }

    for name, field in staticFields do
      self[name] = field;
   end

    return self
end

return Character::{
    new: (instance:Model)->Types.CharacterAyo
}