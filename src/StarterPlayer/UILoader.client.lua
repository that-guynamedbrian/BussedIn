local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local RootUI = require(ReplicatedStorage.RootUI)

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local root = ReactRoblox.createRoot(playerGui)
root:render(React.createElement(RootUI))