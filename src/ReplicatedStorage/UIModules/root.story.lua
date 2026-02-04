local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Character = require(ServerStorage.AyoFramework.AyoTypes.Character)
local RootUI = require(script.Parent.RootUI)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)

local cleanupFolder = workspace:FindFirstChild("UI_LABS_CLEANUP")
local clone = cleanupFolder:Clone()
clone.Parent = workspace
for _, instance in clone:GetChildren() do
    instance:Destroy()
end

local story = {
    react = React;
    reactRoblox = ReactRoblox;
    story = function(props)
        local charModel = Players:CreateHumanoidModelFromUserIdAsync(1151905092)
        charModel:PivotTo(CFrame.new(315.329, 2.5, -602.283)*CFrame.Angles(0, math.rad(180), 0))
        charModel.Parent = workspace
        local char =  Character.new(charModel)

        local janitor = UILabs.Environment.GetJanitor()
        janitor:Add(char.Instance)
        janitor:Add(char.Backpack)
        janitor:Add(char.Inventory)
        janitor:Add(cleanupFolder)
        
        return React.createElement(RootUI, {
            backpackReplica = {
                Data = char
            }
        })
    end;
}

return story