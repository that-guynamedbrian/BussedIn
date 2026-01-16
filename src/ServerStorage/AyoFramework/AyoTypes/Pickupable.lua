local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Types = require(ReplicatedStorage.AyoFramework.Types)


local Pickupable = {}::Types.PickupableAyo;

function Pickupable:Pickup(char:Types.CharacterAyo)
   char.Backpack[self.AyoKey] = char.Backpack[self.AyoKey] or {};
   table.insert(char.Backpack[self.AyoKey], {
      unitKey = self.UnitKey;
      unit = self;
   });
   char.Changed:Fire(char,"Backpack");
end

function Pickupable:Remove(char:Types.CharacterAyo)
   for i, pair in char.Backpack[self.AyoKey] do
      if pair.unitKey == self.UnitKey then
         table.remove(char.Backpack[self.AyoKey],i)
         pair.unit:Cleanup()
         char.Changed.Fire(char,"Backpack")
      end
   end
end

function Pickupable:Equip(char:Types.CharacterAyo)
   local inHand = char.InHand;
   local hum = char.Instance:FindFirstChildOfClass("Humanoid");
   if inHand then
      inHand.HeldBy = nil;
      hum:UnequipTools();
   end
   char.InHand = self;
   self.HeldBy = char;
   hum:EquipTool(self.Instance);
   char.Changed:Fire(char,"InHand");
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
   char.Changed:Fire(char,"InHand");
end

return Pickupable;