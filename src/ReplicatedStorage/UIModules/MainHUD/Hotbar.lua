local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.roact)

local Slot = Roact.Component:extend("InventorySlot")

Slot.defaultProps = {
	AyoKey = "";
}
function Slot:init(initialprops)
	self:setState(initialprops)
end

function Slot:render()
	return Roact.createElement("ImageButton", {
		ImageColor3 = Color3.fromRGB(255, 255, 255),
		Image = "rbxassetid://117567947418404",
		BackgroundTransparency = 1,
		Position = UDim2.new(0.001, 0, -0.041, 0),
		Size = UDim2.new(0.095, 0, 1.078, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		TextLabel = Roact.createElement("TextLabel", {
			Position = UDim2.new(0.000, 0, 0.090, 0),
			BackgroundTransparency = 1,
			TextColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.new(0.317, 0, 0.285, 0),
			Text = "+",
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		})
	})
end

return Roact.createElement("Frame", {
	Position = UDim2.new(0.309, 0, 0.907, 0),
	Size = UDim2.new(0.382, 0, 0.073, 0),
	BackgroundTransparency = 1,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
}, {
	BG = Roact.createElement("ImageLabel", {
		ImageColor3 = Color3.fromRGB(255, 255, 255),
		Image = "rbxassetid://89385253162271",
		BackgroundTransparency = 1,
		Position = UDim2.new(-0.020, 0, -0.199, 0),
		Size = UDim2.new(1.040, 0, 1.452, 0),
		Transparency = 1,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}),

	InnerSlots = Roact.createElement("Frame", {
		Position = UDim2.new(0.011, 0, -0.024, 0),
		Size = UDim2.new(0.968, 0, 0.915, 0),
		BackgroundTransparency = 1,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		UIListLayout = Roact.createElement("UIListLayout", {
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0.007, 0),
			SortOrder = Enum.SortOrder.LayoutOrder,
		}),

		[1] = Roact.createElement(Slot,{}),

		[2] = Roact.createElement(Slot,{}),

		[3] = Roact.createElement(Slot,{}),

		[4] = Roact.createElement(Slot,{}),

		[5] = Roact.createElement(Slot,{}),

		[6] = Roact.createElement(Slot,{}),

		[7] = Roact.createElement(Slot,{}),

		[8] = Roact.createElement(Slot,{}),

		[9] = Roact.createElement(Slot,{}),

		[10] = Roact.createElement(Slot,{})
	}),

	UIAspectRatioConstraint = Roact.createElement("UIAspectRatioConstraint", {
		AspectRatio = 9.140000343322754,
	})})
