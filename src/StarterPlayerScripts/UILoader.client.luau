local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")


local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local ReplicaClient = require(ReplicatedStorage.ReplicaClient)
local RootUI = require(ReplicatedStorage.UIModules.RootUI)

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true


local co = coroutine.running()
ReplicaClient.OnNew("LocalCharacterAyo", function(replica: ReplicaClient.Replica)
    coroutine.resume(co, replica)
end)
ReplicaClient.RequestData()
local backpackReplica:ReplicaClient.Replica = coroutine.yield()

print(backpackReplica.Data)

StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
local root = ReactRoblox.createRoot(screenGui)
root:render(React.createElement(RootUI,{
    backpackReplica = backpackReplica
}))