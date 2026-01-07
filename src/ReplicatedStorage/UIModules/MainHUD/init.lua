local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LeftSlot = require(script.LeftSlot)
local React = require(ReplicatedStorage.Packages.React)


return function()
	return React.createElement("ScreenGui", {
	}, {
		LeftButtonsFrame = React.createElement(LeftSlot),--[[
		SlotFrame = Hotbar(),
		TopRightFrame = TopRight(),]]
	})
end