---@class AyoUnit
---@field Instance Instance
---@field AyoType string
---@field AyoKey string
---@field UnitKey string

---@class CharacterAyo : AyoUnit
---@field Instance Model
---@field AyoType "Character"
---@field Inventory table<number,PickupableAyo>

---@type CharacterAyo
local a = {}
local b = a.Inventory
return nil