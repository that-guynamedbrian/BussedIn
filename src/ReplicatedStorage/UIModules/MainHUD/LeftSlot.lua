local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)

return React.createElement("Frame", {
	BorderColor3 = Color3.fromRGB(0, 0, 0),
	BackgroundTransparency = 1,
	Position = UDim2.new(0.0109999999, 0, 0.333999991, 0),
	Size = UDim2.new(0.0710000023, 0, 0.644999981, 0),
	BorderSizePixel = 0,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
}, {
	["NPC"] = React.createElement("ImageButton", {
		ScaleType = Enum.ScaleType.Fit,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.920833826, 0, 0.172290221, 0),
		Image = "rbxassetid://105665850741368",
		BackgroundTransparency = 1,
		Position = UDim2.new(0.0364963487, 0, 0.00682601379, 0),
		ImageContent = Content,
		ZIndex = 11,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {}),

	["Inventory"] = React.createElement("ImageButton", {
		ScaleType = Enum.ScaleType.Fit,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.920833826, 0, 0.172290176, 0),
		Image = "rbxassetid://123467898068713",
		BackgroundTransparency = 1,
		Position = UDim2.new(0.0364963487, 0, 0.656047106, 0),
		ImageContent = Content,
		ZIndex = 11,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {}),

	["Avatar"] = React.createElement("ImageButton", {
		ScaleType = Enum.ScaleType.Fit,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.920833826, 0, 0.172290191, 0),
		Image = "rbxassetid://104956935339886",
		BackgroundTransparency = 1,
		Position = UDim2.new(0.0364963487, 0, 0.817689836, 0),
		ImageContent = Content,
		ZIndex = 11,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {}),

	["Transport"] = React.createElement("ImageButton", {
		ScaleType = Enum.ScaleType.Fit,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.920833826, 0, 0.172290221, 0),
		Image = "rbxassetid://139449258354411",
		BackgroundTransparency = 1,
		Position = UDim2.new(0.0364963487, 0, 0.168468803, 0),
		ImageContent = Content,
		ZIndex = 11,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {}),

	["BG"] = React.createElement("ImageLabel", {
		ScaleType = Enum.ScaleType.Fit,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Image = "rbxassetid://116561793149912",
		BackgroundTransparency = 1,
		Position = UDim2.new(-0.124087594, 0, -0.0237720963, 0),
		ImageContent = Content,
		Size = UDim2.new(1.24461174, 0, 1.04535484, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {}),

	["Anim"] = React.createElement("ImageButton", {
		ScaleType = Enum.ScaleType.Fit,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.49150604, 0, 0.0812618509, 0),
		Image = "rbxassetid://95936900854248",
		BackgroundTransparency = 1,
		Position = UDim2.new(1.85060084, 0, -0.493665069, 0),
		ImageContent = Content,
		ZIndex = 11,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {}),
})