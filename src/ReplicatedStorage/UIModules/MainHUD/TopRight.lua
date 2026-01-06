local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.roact)

return Roact.createElement("Frame", {
	Position = UDim2.new(0.011, 0, 0.334, 0),
	Size = UDim2.new(0.071, 0, 0.645, 0),
	BackgroundTransparency = 1,
	BackgroundColor3 = Color3.fromRGB(255, 255, 255),
}, {
	["Time&Weather"] = Roact.createElement("Frame", {
		Position = UDim2.new(12.380, 0, -0.489, 0),
		Size = UDim2.new(1.358, 0, 0.086, 0),
		BackgroundTransparency = 1,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		BG = Roact.createElement("ImageLabel", {
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			Image = "rbxassetid://134108355468551",
			BackgroundTransparency = 1,
			Position = UDim2.new(-0.079, 0, -0.217, 0),
			Size = UDim2.new(1.156, 0, 1.418, 0),
			Transparency = 1,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}),

		TimeIcon = Roact.createElement("ImageLabel", {
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			Image = "rbxassetid://113705625836226",
			BackgroundTransparency = 1,
			Position = UDim2.new(0.070, 0, 0.133, 0),
			Size = UDim2.new(0.231, 0, 0.717, 0),
			Transparency = 1,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}),

		Time = Roact.createElement("TextLabel", {
			Position = UDim2.new(0.344, 0, 0.367, 0),
			Font = Enum.Font.Unknown,
			BackgroundTransparency = 1,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Size = UDim2.new(0.510, 0, 0.473, 0),
			Text = "10:00 AM",
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}),

		Day = Roact.createElement("TextLabel", {
			Position = UDim2.new(0.446, 0, 0.131, 0),
			Font = Enum.Font.Unknown,
			BackgroundTransparency = 1,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Size = UDim2.new(0.212, 0, 0.326, 0),
			Text = "TUE",
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}),

		WeatherIcon = Roact.createElement("ImageLabel", {
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			Image = "rbxassetid://104285287335373",
			BackgroundTransparency = 1,
			Position = UDim2.new(0.339, 0, 0.131, 0),
			Size = UDim2.new(0.105, 0, 0.326, 0),
			Transparency = 1,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}),

		UIAspectRatioConstraint = Roact.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.140000104904175,
		})}),

	MoneyCount = Roact.createElement("Frame", {
		Position = UDim2.new(10.870, 0, -0.489, 0),
		Size = UDim2.new(1.358, 0, 0.086, 0),
		BackgroundTransparency = 1,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		BG = Roact.createElement("ImageLabel", {
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			Image = "rbxassetid://134108355468551",
			BackgroundTransparency = 1,
			Position = UDim2.new(-0.079, 0, -0.217, 0),
			Size = UDim2.new(1.156, 0, 1.418, 0),
			Transparency = 1,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}),

		MoneyIcon = Roact.createElement("ImageLabel", {
			ImageColor3 = Color3.fromRGB(255, 255, 255),
			Image = "rbxassetid://107412950382588",
			BackgroundTransparency = 1,
			Position = UDim2.new(0.070, 0, 0.133, 0),
			Size = UDim2.new(0.231, 0, 0.717, 0),
			Transparency = 1,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}),

		Money = Roact.createElement("TextLabel", {
			Position = UDim2.new(0.349, 0, 0.133, 0),
			Font = Enum.Font.Unknown,
			BackgroundTransparency = 1,
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Size = UDim2.new(0.510, 0, 0.590, 0),
			Text = "5,467",
			TextScaled = true,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}),

		UIAspectRatioConstraint = Roact.createElement("UIAspectRatioConstraint", {
			AspectRatio = 3.140000104904175,
		})})})