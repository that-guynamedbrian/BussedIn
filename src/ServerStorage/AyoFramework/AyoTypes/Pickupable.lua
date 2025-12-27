local ServerStorage = game:GetService("ServerStorage");
local Types = require(ServerStorage.AyoFramework.Types);


---@class PickupableAyo:AyoUnit
local Pickupable = {}::Types.PickupableAyo;

function _len(tbl)
   local n = 0;
   for _, _ in tbl do
      n += 1
   end
   return n;
end

---comment
---@param char any
function Pickupable:Equip(char)
   local inHand = char.InHand;
   if inHand then
      inHand:Unequip(char);
   end
   char.InHand = self;
   self.Held = true;
   self.HeldBy = char;
end

---comment
function Pickupable:Unequip()
   if not self.Held then
      warn("Not in hand");
      return;
   end
   local char = self.HeldBy;
   local grip = char:FindFirstChild("Right Arm")
end

return Pickupable;