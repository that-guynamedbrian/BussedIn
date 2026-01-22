local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Types = require(ReplicatedStorage.AyoFramework.Types)
local Character = require(ServerStorage.AyoFramework.AyoTypes.Character)
local Tool = require(ServerStorage.AyoFramework.AyoTypes.Tool)
local Net = require(ReplicatedStorage.Utils.Net)
local Handler = {}

local function getChar(player:Player): (Model,Types.CharacterAyo)
    local charInstance = player.Character or player.CharacterAdded:Wait()
    local char = Character.fromUnitKey(charInstance:GetAttribute("unitKey"))
    return charInstance, char
end

local Actions = {

    AddToInventory = function(player:Player, toAdd:Instance)
        local _charInstance, char = getChar(player)
        assert(
            typeof(toAdd) == "Instance" and (toAdd:IsA("Tool") or toAdd:IsA("Model")),
            "Second arg to AddToInventory must be a Tool or Model"
        )
        assert(
            toAdd:IsDescendantOf(char.Backpack),
            "Tool/Model to add to Inventory must be in Backpack"
        )

        local item = Tool.fromUnitKey(toAdd:GetAttribute("unitKey")::string)
        char:AddToInventory(item)
    end;

    RemoveFromInventory = function(player:Player, toRemove:Instance)
        local _charInstance, char = getChar(player)
        assert(
            typeof(toRemove) == "Instance" and (toRemove:IsA("Tool") or toRemove:IsA("Model")),
            "Second arg to RemoveFromInventory must be a Tool or Model"
        )
        assert(
            toRemove:IsDescendantOf(char.Inventory),
            "Tool/Model to remove from Inventory must be in Inventory"
        )
        local item = Tool.fromUnitKey(toRemove:GetAttribute("unitKey")::string)
        char:RemoveFromInventory(item)
    end;

    Equip = function(player:Player, toEquip:Instance)
        local _charInstance, char = getChar(player)
        assert(
            typeof(toEquip) == "Instance" and toEquip:IsA("Tool"),
            "Second arg to Equip must be a Tool"
        )
        assert(
            toEquip:IsDescendantOf(char.Inventory),
            "Tool to equip must be in inventory"
        )
        local tool = Tool.fromUnitKey(toEquip:GetAttribute("unitKey")::string)
        char:Equip(tool)
    end;

    Unequip = function(player:Player, toUnequip:Instance)
        local _charInstance, char = getChar(player)
        assert(
            typeof(toUnequip) == "Instance" and toUnequip:IsA("Tool"),
            "Second arg to Equip must be a Tool"
        )
        assert(
            toUnequip:IsDescendantOf(_charInstance),
            "Tool to equip must be in inventory"
        )
        local tool = Tool.fromUnitKey(toUnequip:GetAttribute("unitKey")::string)
        char:Unequip(tool)
    end
}

for action, callback in Actions do
    Net.HandleRequest(action, function(...): boolean
        local success, errormessage = pcall(callback,...)
        if not success then warn(errormessage) end
        return success
    end);
end

return Handler