local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Types = require(ReplicatedStorage.AyoFramework.Types)


local Pickupable = {}::Types.PickupableAyo;

function Pickupable:Pickup(char:Types.CharacterAyo)
   self.Instance.Parent = char.Backpack;
   char.Changed:Fire(char,"Backpack");
end

function Pickupable:Remove(char:Types.CharacterAyo)
   for i, instance in char.Backpack do
      if instance:GetAttribute("unitKey") == self.UnitKey then
         self:Cleanup();
      end
   end
   char.Changed:Fire(char,"Backpack");
end

function Pickupable:Equip(char:Types.CharacterAyo)
   local inHand = char.InHand;
   local hum = char.Instance:FindFirstChildOfClass("Humanoid");
   if inHand then
      inHand.HeldBy = nil;
      hum:UnequipTools();
      inHand.Instance.Parent = char.Inventory
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
   self.Instance.Parent = char.Inventory
   char.Changed:Fire(char,"InHand");
end

return Pickupable;