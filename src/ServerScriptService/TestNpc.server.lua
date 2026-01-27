local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local Character = require(ServerStorage.AyoFramework.AyoTypes.Character)
local Tool = require(ServerStorage.AyoFramework.AyoTypes.Tool)

local npcModel:Model = ServerStorage.AyoFramework.Characters.Enemy1:Clone()
npcModel.Parent = workspace
npcModel:MoveTo(Vector3.new(61.033, -0.807, 84.919))
local char = Character.new(npcModel)

local VISION_RANGE = 50
local EQUIP_RANGE = 20
local ATTACK_RANGE = 8
local ATTACK_COOLDOWN = 1
local EQUIP_COOLDOWN = 3

local isAlive = true
local inSight = false
local inEquippingRange = false
local inAttackingRange = false
local onCooldown = false
local onEquipCooldown = false

local moveToConn:RBXScriptConnection? = nil

local targethrp:Part = nil

local sword = Tool.new("classic_sword")
sword:Pickup(char)

local humanoid = npcModel:WaitForChild("Humanoid")::Humanoid
local hrp = npcModel:WaitForChild("HumanoidRootPart")::Part

local function getDistanceFromTarget()
    return (hrp.Position - targethrp.Position).Magnitude
end

local function getClosestCharacter()
    local distances = {}
    local characters = {}
    
    local min = math.huge
    for _, player in Players:GetPlayers() do
        local playerchar = player.Character or player.CharacterAdded:Wait()
        local playerhrp = playerchar:FindFirstChild("HumanoidRootPart")::Part
        local dist = (playerhrp.Position-hrp.Position).Magnitude
        min = dist < min and dist or min
        table.insert(distances, dist)
        table.insert(characters, playerchar)
    end

    for index, dist in distances do
        if dist == min then
            return dist, characters[index]
        end
    end
    return nil
end

while isAlive do

    if inAttackingRange then
        
        if not onCooldown then
            sword:Activate(char)
            print("Attacking target")
            task.spawn(function()
                onCooldown = true
                task.wait(ATTACK_COOLDOWN)
                onCooldown = false
            end)
        end
        local dist = getDistanceFromTarget()
        if dist > ATTACK_RANGE then
            inAttackingRange = false
        end

    elseif inEquippingRange then
        
        local dist = getDistanceFromTarget()
        if dist < ATTACK_RANGE then
           inAttackingRange = true
        elseif dist > EQUIP_RANGE then
            if not onEquipCooldown then
                sword:Unequip(char)
                inEquippingRange = false
                print("Unequipped sword")
                task.spawn(function()
                    onEquipCooldown = true
                    task.wait(EQUIP_COOLDOWN)
                    onEquipCooldown = false
                end)
            end
        end

    elseif inSight then
        
        humanoid:MoveTo(targethrp.Position)
        print("Moving to target")
        moveToConn = moveToConn or humanoid.MoveToFinished:Connect(function(reached:boolean)
            humanoid:MoveTo(targethrp.Position)
        end)

        local dist = getDistanceFromTarget() 
        if dist < EQUIP_RANGE then
            if not onEquipCooldown then
                sword:Equip(char)
                inEquippingRange = true
                print("Equipped sword")
                task.spawn(function()
                    onEquipCooldown = true
                    task.wait(EQUIP_COOLDOWN)
                    onEquipCooldown = false
                end)
            end
        elseif dist > VISION_RANGE then 
            if moveToConn ~= nil then
                moveToConn:Disconnect()
                moveToConn = nil
            end
            inSight = false
            print("Exited vision range")
        end

    else
        
        local dist, playerchar = getClosestCharacter()
        if playerchar and dist < VISION_RANGE then
            target = playerchar
            targethrp = playerchar.HumanoidRootPart
            inSight = true
            print("Entered vision range")
        end

    end

    task.wait()
end
