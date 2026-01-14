local ServerStorage = game:GetService("ServerStorage");
local Types = require(ServerStorage.AyoFramework.Types);

local Pickupable = {}::Types.PickupableAyo;

function Pickupable:Pickup(char:Types.CharacterAyo)
   char.Backpack[self.AyoKey] = char.Backpack[self.AyoKey] or {};
   table.insert(char.Backpack[self.AyoKey], {
      unitKey = self.UnitKey;
      unit = self;
   });
end

function Pickupable:Equip(char:Types.CharacterAyo)
   local inHand = char.InHand;
   local hum = char.Instance:FindFirstChild("Humanoid");
   if inHand then
      inHand:Unequip(char);
   end
   char.InHand = self;
   self.HeldBy = char;
   hum:EquipTool(self.Instance);
end

function Pickupable:Unequip()
   if self.HeldBy == nil then
      warn("Not in hand");
      return;
   end
   local char = self.HeldBy;
   char.Instance:FindFirstChildOfClass("Humanoid"):UnequipTools();
   char.InHand = nil;
   self.HeldBy = nil;
end

return Pickupable;