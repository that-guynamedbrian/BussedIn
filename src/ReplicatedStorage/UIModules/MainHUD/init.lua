local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LeftSlot = require(script.LeftSlot)
local React = require(ReplicatedStorage.Packages.React)


return function(props)
	return React.createElement("Frame", {
			Size = UDim2.fromScale(1,1),
			Transparency = 1,
		}, {
			LeftButtonsFrame = React.createElement(LeftSlot,props),--[[
			SlotFrame = Hotbar(),
			TopRightFrame = TopRight(),]]
		})
	end