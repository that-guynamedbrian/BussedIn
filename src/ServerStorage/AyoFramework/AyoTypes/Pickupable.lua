local ServerStorage = game:GetService("ServerStorage");
local Types = require(ServerStorage.AyoFramework.Types);


---@class PickupableAyo:AyoUnit
---@field Instance Tool
---@field HeldBy CharacterAyo
local Pickupable = {};

function _len(tbl)
   local n = 0;
   for _, _ in tbl do
      n += 1
   end
   return n;
end

---comment
---@param char CharacterAyo
function Pickupable:Equip(char)
   local inHand = char.InHand;
   local hum:Humanoid = char.Instance:FindFirstChild("Humanoid");
   if inHand then
      inHand:Unequip(char);
   end
   char.InHand = self;
   self.HeldBy = char;
   hum:EquipTool(self.Instance)
end

---comment
function Pickupable:Unequip()
   if self.HeldBy == nil then
      warn("Not in hand");
      return;
   end
   local char = self.HeldBy;
   local grip = char:FindFirstChild("Right Arm")
end

return Pickupable;