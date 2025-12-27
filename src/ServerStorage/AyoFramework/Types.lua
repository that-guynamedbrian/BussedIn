
export type AyoUnit = {
   Instance: Instance;
   AyoType: string;
   AyoKey: string;
   UnitKey: string;
};

export type CharacterAyo = {
   Instance: Model;
   AyoType: "Character";
   InHand: ToolAyo|PlaceableAyo;
   Inventory: { -- maps ayoKeys to array of {unitKey, unit} pairs with that ayoKey
      [string]:{
         {
            unitKey:string,
            unit:ToolAyo|PlaceableAyo|InteractableAyo
         }
      }
   };

   Pickup: (self:CharacterAyo, toPickup:PickupableAyo)->();
   Equip: (self:CharacterAyo, toEquip:PickupableAyo)->();
   Unequip: (self:CharacterAyo)->();
   Remove: (self:CharacterAyo, count:{[string]:number})->(); -- count: {[ayoKey]:number}
   Activate: (self:CharacterAyo, toActivate:ToolAyo)->();
   Place: (self:CharacterAyo, toPlace:PlaceableAyo, location:CFrame)->();
   Interact: (self:CharacterAyo, toInteract:InteractableAyo)->();
} & AyoUnit;

export type PlayerAyo = {
   AyoType: "Player";
   PlayerObject: Player
} & CharacterAyo;

export type PickupableAyo = {
   Held: boolean;
   HeldBy: string;

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
   Instance: Model;
   AyoType: "Placeable";

   Place: (self:PlaceableAyo, char:CharacterAyo, location:CFrame)->();
} & PickupableAyo;

export type InteractableAyo = {
   Instance: Model;
   AyoType: "Interactable";

   Interact: (self:InteractableAyo, char:CharacterAyo)->();
} & AyoUnit;

return {};