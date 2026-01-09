local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Inventory = require(script.Parent.Inventory)
local MainHUD = require(script.Parent.MainHUD)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local RootUI = require(ReplicatedStorage.RootUI)
local LeftSlot = require(ReplicatedStorage.UIModules.MainHUD.LeftSlot)


local story = {
    react = React;
    reactRoblox = ReactRoblox;
    story = function(props)
        return React.createElement(RootUI)
    end;
}

return story