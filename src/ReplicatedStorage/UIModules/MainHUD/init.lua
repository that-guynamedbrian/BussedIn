local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LeftSlot = require(script.LeftSlot)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)


return React.createElement("ScreenGui", {}, {
	LeftButtonsFrame = LeftSlot(),
	SlotFrame = Hotbar(),
	TopRightFrame = TopRight(),
})
