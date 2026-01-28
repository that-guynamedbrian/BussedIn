local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Types = require(ReplicatedStorage.AyoFramework.Types)
local Character = require(ServerStorage.AyoFramework.AyoTypes.Character)
local Placeable = require(ServerStorage.AyoFramework.AyoTypes.Placeable)
local Tool = require(ServerStorage.AyoFramework.AyoTypes.Tool)
local Net = require(ReplicatedStorage.Utils.Net)

local function getChar(player:Player): (Model,Types.CharacterAyo)
    local charInstance = player.Character or player.CharacterAdded:Wait()
    local char = Character.fromUnitKey(charInstance:GetAttribute("unitKey"))
    return charInstance, char
end

local Actions = {

    AddToInventory = function(player:Player, toAdd:Instance)
        local _charInstance, char = getChar(player)
        assert(
            typeof(toAdd) == "Instance",
            "Second arg to AddToInventory must be a Tool or Placeable"
        )
        assert(
            toAdd:IsDescendantOf(char.Backpack),
            "Tool/Placeable to add to Inventory must be in Backpack"
        )

        local item:Types.PickupableAyo;
        if toAdd:IsA("Tool") then
            item = Tool.fromUnitKey(toAdd:GetAttribute("unitKey")::string)
            char:AddToInventory(item)
        elseif toAdd:IsA("Model") then
            item = Placeable.fromUnitKey(toAdd:GetAttribute("unitKey")::string)
        else
            error("Second arg to AddToInventory must be a Tool or Model")
        end

        char:AddToInventory(item)
    end;

    RemoveFromInventory = function(player:Player, toRemove:Instance)
        local _charInstance, char = getChar(player)
        assert(
            typeof(toRemove) == "Instance",
            "Second arg to RemoveFromInventory must be a Tool or Placeable"
        )
        assert(
            toRemove:IsDescendantOf(char.Inventory),
            "Tool/Placeable to remove from Inventory must be in Inventory"
        )

        local item:Types.PickupableAyo;
        if toRemove:IsA("Tool") then
            item = Tool.fromUnitKey(toRemove:GetAttribute("unitKey")::string)
            char:AddToInventory(item)
        elseif toRemove:IsA("Model") then
            item = Placeable.fromUnitKey(toRemove:GetAttribute("unitKey")::string)
        else
            error("Second arg to AddToInventory must be a Tool or Placeable")
        end
        char:RemoveFromInventory(item)
    end;

    Equip = function(player:Player, toEquip:Instance)
        local _charInstance, char = getChar(player)
        assert(
            typeof(toEquip) == "Instance",
            "Second arg to Equip must be a Tool or Placeable"
        )
        assert(
            toEquip:IsDescendantOf(char.Inventory),
            "Tool/Placeable to equip must be in inventory"
        )
        local item:Types.PickupableAyo;
        if toEquip:IsA("Tool") then
            item = Tool.fromUnitKey(toEquip:GetAttribute("unitKey")::string)
            char:AddToInventory(item)
        elseif toEquip:IsA("Model") then
            item = Placeable.fromUnitKey(toEquip:GetAttribute("unitKey")::string)
        else
            error("Second arg to AddToInventory must be a Tool or Placeable")
        end
        char:Equip(item)
    end;

    Unequip = function(player:Player)
        local _charInstance, char = getChar(player)
        local item = char.InHand
        assert(item ~= nil, "No Tool/Placeable to unequip")
        char:Unequip(item)
    end;

    Place = function(player:Player, toPlace:Types.PlaceableAyo, start:Vector3, direction:Vector3)
        local _charInstance, char = getChar(player)
        assert(
            typeof(toPlace) == "Instance" and (toPlace:IsA("Model")),
            "Second arg to Place must be a Model"
        )
        assert(
            toPlace:IsDescendantOf(char.Inventory),
            "Tool to equip must be in inventory"
        )
        assert(
            typeof(start) == "Vector3" or typeof(direction) == "Vector3",
            "Invalid start/end"
        )
        
        local distance = (_charInstance:FindFirstChild("HumanoidRootPart").Position - start).Magnitude
        direction = direction.Unit * Character.PLACEMENT_RANGE
        assert(distance <= Character.MAX_CAM_DISTANCE, "Placement raycast start position too far from Character")
        
        local placeable = Placeable.fromUnitKey(toPlace:GetAttribute("unitKey")::string)
        
        assert(char:Place(placeable, start, direction), "Failed Placement")
    end
}

for action, callback in Actions do
    Net.HandleRequest(action, function(...): boolean
        local success, errormessage = pcall(callback,...)
        if not success then warn(errormessage) end
        return success
    end);
end