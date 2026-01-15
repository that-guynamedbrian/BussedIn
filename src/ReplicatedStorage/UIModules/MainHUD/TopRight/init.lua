local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)

return function()
    return React.createElement("Frame", {
	BorderColor3 = Color3.fromRGB(0, 0, 0),
	BackgroundTransparency = 1,
	Position = UDim2.new(0.0114583336, 0, 0.333951771, 0),
	Size = UDim2.new(0.0713541657, 0, 0.644712448, 0),
	BorderSizePixel = 0,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
}, {
	["Time&Weather"] = React.createElement("Frame", {
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(12.3800001, 0, -0.488999993, 0),
		Size = UDim2.new(1.35766423, 0, 0.0863309354, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		["BG"] = React.createElement("ImageLabel", {
			ScaleType = Enum.ScaleType.Fit,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Image = "rbxassetid://134108355468551",
			BackgroundTransparency = 1,
			Position = UDim2.new(-0.0786493793, 0, -0.216666669, 0),
			
			Size = UDim2.new(1.15581632, 0, 1.41775596, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {}),

		["TimeIcon"] = React.createElement("ImageLabel", {
			ZIndex = 2,
            ScaleType = Enum.ScaleType.Fit,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Image = "rbxassetid://113705625836226",
			BackgroundTransparency = 1,
			Position = UDim2.new(0.0698924735, 0, 0.13333334, 0),
			
			Size = UDim2.new(0.231182799, 0, 0.716666639, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {}),

		["Time"] = React.createElement("TextLabel", {
			ZIndex = 2,
            FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
			TextSize = 14,
			Size = UDim2.new(0.51019156, 0, 0.47326383, 0),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = "10:00 AM",
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.344083428, 0, 0.366861254, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextWrap = true,
		}, {}),

		["Day"] = React.createElement("TextLabel", {
			ZIndex = 2,
            FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
			TextSize = 14,
			Size = UDim2.new(0.212087557, 0, 0.326230496, 0),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = "TUE",
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.446287185, 0, 0.130916551, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextWrap = true,
		}, {}),

		["WeatherIcon"] = React.createElement("ImageLabel", {
			ZIndex = 2,
            ScaleType = Enum.ScaleType.Fit,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Image = "rbxassetid://104285287335373",
			BackgroundTransparency = 1,
			Position = UDim2.new(0.338850051, 0, 0.130808696, 0),
			
			Size = UDim2.new(0.105270758, 0, 0.326338351, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {}),

		["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.140000104904175,
		}, {}),
	}),

	["MoneyCount"] = React.createElement("Frame", {
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(10.8699999, 0, -0.489208639, 0),
		Size = UDim2.new(1.35766423, 0, 0.0863309354, 0),
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		["BG"] = React.createElement("ImageLabel", {
			ScaleType = Enum.ScaleType.Fit,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Image = "rbxassetid://134108355468551",
			BackgroundTransparency = 1,
			Position = UDim2.new(-0.0786493793, 0, -0.216666669, 0),
			
			Size = UDim2.new(1.15581632, 0, 1.41775596, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {}),

		["MoneyIcon"] = React.createElement("ImageLabel", {
			ScaleType = Enum.ScaleType.Fit,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Image = "rbxassetid://107412950382588",
			BackgroundTransparency = 1,
			Position = UDim2.new(0.0698924735, 0, 0.13333334, 0),
			ZIndex = 2,
			Size = UDim2.new(0.231182799, 0, 0.716666639, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {}),

		["Money"] = React.createElement("TextLabel", {
			ZIndex = 2,
            FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
			TextSize = 14,
			Size = UDim2.new(0.51019156, 0, 0.590125144, 0),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			Text = "5,467",
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.34946236, 0, 0.13333334, 0),
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextWrap = true,
		}, {}),

		["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.140000104904175,
		}, {}),
	}),
})
end
