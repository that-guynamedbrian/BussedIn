---@class AyoUnit
---@field Instance Instance
---@field AyoType string
---@field AyoKey string
---@field UnitKey string

---@class CharacterAyo : AyoUnit
---@field Instance Model
---@field AyoType "Character"
---@field Inventory table<string, table<string, PickupableAyo>> { ayoKey : {unitKey:PickupableAyo} }
---@field Pickup fun(self:CharacterAyo, toPickup:PickupableAyo)
---@field Equip fun(self:CharacterAyo, toEquip:PickupableAyo)
---@field Unequip fun(self:CharacterAyo, toUnequip:PickupableAyo)
---@field Remove fun(self:CharacterAyo, count:table<string,number>) count: {ayoKey: numberToRemove}
---@

---@type CharacterAyo
local a = {}
local b =
local d =
return nil