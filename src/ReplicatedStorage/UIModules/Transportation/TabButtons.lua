local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)

return function(props) 
    local buttonMap = React.useMemo(function()
        return {
            BikeButton = "BIKE";
            CarButton = "CAR";
            SkateboardButton = "SKATEBOARD";
        }
    end)
    local activatedFunc = React.useCallback(function(instance)
        props.setCurrentTab(buttonMap[instance.Name])
    end)
    
    return React.createElement(React.Fragment, nil, {
        
        ["BikeButton"] = React.createElement("ImageButton", {
			ScaleType = Enum.ScaleType.Fit,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			HoverImage = "rbxassetid://139901416224436",
			Size = UDim2.new(0.314616174, 0, 0.077222921, 0),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.0209580846, 0, 0.0169660673, 0),
			Image = "rbxassetid://81680086740725",
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            [React.Event.Activated] = activatedFunc
		}, {
			["TextLabel"] = React.createElement("TextLabel", {
				FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
				TextSize = 14,
				Size = UDim2.new(0.287914157, 0, 0.330845982, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Text = "BIKE",
				FontSize = Enum.FontSize.Size14,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.352106631, 0, 0.277817726, 0),
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextWrap = true,
			}, {}),
		}),

        ["CarButton"] = React.createElement("ImageButton", {
			ScaleType = Enum.ScaleType.Fit,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			HoverImage = "rbxassetid://139901416224436",
			Size = UDim2.new(0.314616174, 0, 0.077222921, 0),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.662999988, 0, 0.0169660673, 0),
			Image = "rbxassetid://81680086740725",
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            [React.Event.Activated] = activatedFunc
		}, {
			["TextLabel"] = React.createElement("TextLabel", {
				FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
				TextSize = 14,
				Size = UDim2.new(0.245033637, 0, 0.426481307, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Text = "CAR",
				FontSize = Enum.FontSize.Size14,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.37325424, 0, 0.230000064, 0),
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextWrap = true,
			}, {}),
		}),
        
        ["SkateboardButton"] = React.createElement("ImageButton", {
			ScaleType = Enum.ScaleType.Fit,
			BorderColor3 = Color3.fromRGB(0, 0, 0),
			HoverImage = "rbxassetid://139901416224436",
			Size = UDim2.new(0.314616174, 0, 0.077222921, 0),
			BackgroundTransparency = 1,
			Position = UDim2.new(0.341317356, 0, 0.0169660673, 0),
			Image = "rbxassetid://81680086740725",
			BorderSizePixel = 0,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            [React.Event.Activated] = activatedFunc
		}, {
			["TextLabel"] = React.createElement("TextLabel", {
				FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
				TextSize = 14,
				Size = UDim2.new(0.752170682, 0, 0.503879726, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				Text = "SKATEBOARD",
				FontSize = Enum.FontSize.Size14,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.122510053, 0, 0.191300839, 0),
				BorderSizePixel = 0,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextWrap = true,
			}, {}),
		}),
    })
end
