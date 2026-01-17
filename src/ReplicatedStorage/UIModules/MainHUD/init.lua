local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Hotbar = require(script.Hotbar)
local LeftSlot = require(script.LeftSlot)
local TopRight = require(script.TopRight)
local React = require(ReplicatedStorage.Packages.React)


return function(props)
	return React.createElement("Frame", {
			Size = UDim2.fromScale(1,1),
			Transparency = 1,
		}, {
			LeftButtonsFrame = React.createElement(LeftSlot),
			--SlotFrame = React.createElement(Hotbar),
			TopRightFrame = React.createElement(TopRight)
		})
	end