local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local Types = require(ReplicatedStorage.AyoFramework.Types)
local AvailableItems = require(ServerScriptService.AyoFramework.AvailableItems)
local Pickupable = require(script.Parent.Pickupable)

local Placeable = {
    AyoType = "Placeable";
    Pickup = Pickupable.Pickup;
    Remove = Pickupable.Remove;
} :: Types.PlaceableAyo;
Placeable.__index = Placeable;

local placeables_cache = {}

function Placeable:Equip(char:Types.CharacterAyo)
    local inHand = char.InHand;
    if inHand then
        inHand:Unequip(char);
    end
    self.HeldBy = char;
    char.InHand = self;
end

function Placeable:Unequip()
    local char = self.HeldBy;
    char.InHand = nil;
    self.HeldBy = nil;
end

function Placeable:Place(start:Vector3, direction:Vector3)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Include
    params.RespectCanCollide = true
    for _, instance in workspace:GetChildren() do
        if instance:IsA("Folder") then
            params:AddToFilter(instance) 
        end
    end
    local result = workspace:Raycast(start, direction, params)
    if result == nil then
        return false;
    else
        local model = self.Instance
        local size = model:GetExtentsSize();
        local target = CFrame.fromMatrix(result.Position, Vector3.xAxis, result.Normal) * CFrame.new(0,size.Y/2,0);
        model:PivotTo(target);
        model.Parent = workspace;
        local char = self.HeldBy;
        char:Unequip();
        return true;
    end
end

function Placeable.new(ayoKey:string)
    assert(typeof(ayoKey) == "string", "Invalid parameter 'ayoKey', must be of type string");
    local rootInstance = AvailableItems.Placeables[ayoKey]:Clone();
    local unitKey = HttpService:GenerateGUID(false)
    local self = {
        AyoKey = ayoKey;
        UnitKey = unitKey;
        Instance = rootInstance;
    } :: Types.PlaceableAyo;
    
    rootInstance:SetAttribute("ayoType", Placeable.AyoType)
    rootInstance:SetAttribute("ayoKey", ayoKey)
    rootInstance:SetAttribute("unitKey", unitKey)
    rootInstance:SetAttribute("name", rootInstance.Name)

    placeables_cache[unitKey] = self;
    return setmetatable(self, Placeable);
end

function Placeable.fromUnitKey(unitKey:string)
    return placeables_cache[unitKey]
end

return Placeable :: {
    new: (ayoKey:string)->Types.PlaceableAyo;
    fromUnitKey: (unitKey:string)->Types.PlaceableAyo;
};
