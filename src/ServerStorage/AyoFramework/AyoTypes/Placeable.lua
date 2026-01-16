local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Types = require(ReplicatedStorage.AyoFramework.Types)
local AvailableItems = require(ServerScriptService.AyoFramework.AvailableItems)
local Pickupable = require(script.Parent.Pickupable)

local Placeable = {
    AyoType = "Placeable";
    Equip = Pickupable.Equip;
    Unequip = Pickupable.Unequip;
} :: Types.PlaceableAyo;
Placeable.__index = Placeable;
Placeable.__newindex = function(self:Types.CharacterAyo, index, value)
    rawset(self, index, value)
    self.Changed:Fire(self[index]);
end

function Placeable.new(ayoKey:string)
    assert(typeof(ayoKey) == "string", "Invalid parameter 'ayoKey', must be of type string");
    local rootInstance = AvailableItems.Placeables[ayoKey];

    local self = {
        AyoKey = ayoKey;
        Instance = rootInstance;
    } :: Types.PlaceableAyo;
    
    return setmetatable(self, Placeable);
end

return Placeable :: {
    new: (ayoKey:string)->Types.PlaceableAyo;
};
