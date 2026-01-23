local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Signal = require(ReplicatedStorage.Utils.Signal)

export type AyoUnit = {
   Name:string;
   Instance: Instance;
   AyoType: string;
   AyoKey: string;
   UnitKey: string;
   Changed: Signal.Signal;
   Cleanup: (self:AyoUnit)->()
};

export type CharacterAyo = {
   Instance: Model;
   AyoType: "Character";
   InHand: ToolAyo|PlaceableAyo;
   Backpack: Folder;

   Inventory: Folder;

   AddToInventory: (self:CharacterAyo, toAdd:ToolAyo)->();
   RemoveFromInventory: (self:CharacterAyo, toRemove:ToolAyo)->();

   AddToBackpack: (self:CharacterAyo, toPickup:PickupableAyo)->();
   RemoveFromBackpack: (self:CharacterAyo, toRemove:PickupableAyo)->();
   RemoveFromBackpackBulk: (self:CharacterAyo, count:{[string]:number})->();  -- count: {[ayoKey]:number}

   Equip: (self:CharacterAyo, toEquip:ToolAyo)->();
   Unequip: (self:CharacterAyo)->();
   Activate: (self:CharacterAyo, toActivate:ToolAyo)->();
   Place: (self:CharacterAyo, toPlace:PlaceableAyo, location:CFrame)->();
   Interact: (self:CharacterAyo, toInteract:InteractableAyo)->();
} & AyoUnit;

export type PlayerAyo = {
   AyoType: "Player";
   PlayerObject: Player
} & CharacterAyo;

export type PickupableAyo = {
   Instance:Tool;
   Held: boolean;
   HeldBy: CharacterAyo;

   Pickup: (self:PickupableAyo, char:CharacterAyo)->();
   Equip: (self:PickupableAyo, char:CharacterAyo)->();
   Unequip: (self:PickupableAyo, char:CharacterAyo)->();
   Remove: (self:PickupableAyo, char:CharacterAyo)->();
} & AyoUnit;

export type ToolAyo = {
   Instance: Tool;
   AyoType: "Tool";

   Activate: (self:ToolAyo, char:CharacterAyo)->();
} & PickupableAyo;

export type PlaceableAyo = {
   Instance: Tool;
   AyoType: "Placeable";

   Place: (self:PlaceableAyo, char:CharacterAyo, location:CFrame)->();
} & PickupableAyo;

export type InteractableAyo = {
   Instance: Model;
   AyoType: "Interactable";

   Interact: (self:InteractableAyo, char:CharacterAyo)->();
} & AyoUnit;

return {};