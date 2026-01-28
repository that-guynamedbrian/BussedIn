local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Types = require(ReplicatedStorage.AyoFramework.Types)


local Pickupable = {}::Types.PickupableAyo;

function Pickupable:Pickup(char:Types.CharacterAyo)
   local itemFolder = char.Backpack:FindFirstChild(self.AyoKey)
   self.Instance.Parent = itemFolder;
   char.Changed:Fire(char,"Backpack");
end

function Pickupable:Remove(char:Types.CharacterAyo)
   for i, instance in char.Backpack:GetChildren() do
      if instance:GetAttribute("unitKey") == self.UnitKey then
         self:Cleanup();
      end
   end
   char.Changed:Fire(char,"Backpack");
end

function Pickupable:Equip(char:Types.CharacterAyo)
   local inHand = char.InHand;
   local hum = char.Instance:FindFirstChildOfClass("Humanoid");
   local hrp = char.Instance:FindFirstChild("HumanoidRootPart");
   local networkOwner = hrp:GetNetworkOwner();
   if inHand then
      inHand:Equip(char);
   end
   char.InHand = self;
   self.HeldBy = char;
   hum:EquipTool(self.Instance);
   hrp:SetNetworkOwner(networkOwner);
   char.Changed:Fire(char,"InHand");
end

function Pickupable:Unequip()
   local char = self.HeldBy;
   local hrp = char.Instance:FindFirstChild("HumanoidRootPart")
   local networkOwner = hrp:GetNetworkOwner()
   if self.HeldBy == nil then
      warn("Not in hand");
      return;
   end
   char.Instance:FindFirstChildOfClass("Humanoid"):UnequipTools();
   hrp:SetNetworkOwner(networkOwner)
   char.InHand = nil;
   self.HeldBy = nil;
   self.Instance.Parent = char.Inventory
   char.Changed:Fire(char,"InHand");
end

return Pickupable;