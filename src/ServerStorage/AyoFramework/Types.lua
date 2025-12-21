export type Pickupable = {
    Pickup: (self:Pickupable)->();
    Equip: (self:Pickupable)->();
    Unequip: (self:Pickupable)->();
    Remove: (self:Pickupable)->();
}

export type Tool = Pickupable & {
    Activate: (self:Tool)->();
}

export type Placeable = Pickupable & {
    Place: (self:Pickupable)->();
}