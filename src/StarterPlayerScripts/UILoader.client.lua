local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local RootUI = require(ReplicatedStorage.UIModules.RootUI)

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.IgnoreGuiInset = true
local root = ReactRoblox.createRoot(screenGui)
root:render(React.createElement(RootUI))