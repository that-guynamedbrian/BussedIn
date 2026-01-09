--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)

local function createItemIcon(categoryName:string) -- replace with itemName later
	return React.createElement("ImageButton", {
		ScaleType = Enum.ScaleType.Fit,

		HoverImage = "rbxassetid://82913695333014",
		Size = UDim2.new(0.156494528, 0, 0.113507375, 0),
		BackgroundTransparency = 1,
		Position = UDim2.new(0.0566875525, 0, -1.81398736e-08, 0),
		Image = "rbxassetid://120763253309763",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		["ImageLabel"] = React.createElement("ImageLabel", {
			ScaleType = Enum.ScaleType.Fit,
			Image = "rbxassetid://140624922048936",
			BackgroundTransparency = 1,
			Position = UDim2.new(0.227649018, 0, 0.192578718, 0),
			Size = UDim2.new(0.527449369, 0, 0.493510336, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {}),

		["ItemName"] = React.createElement("TextLabel", {
			FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
			TextSize = 14,
			Size = UDim2.new(0.378614932, 0, 0.162858352, 0),
			TextColor3 = Color3.fromRGB(0, 91, 175),
			Text = categoryName.." Name",
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.0708594769, 0, 0.0297252201, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextWrap = true,
		}, {}),

		["Delete"] = React.createElement("ImageButton", {
			ScaleType = Enum.ScaleType.Fit,
	
			Image = "rbxassetid://86910365917899",
			BackgroundTransparency = 1,
			Position = UDim2.new(0.839231789, 0, 0.0545147769, 0),
			Size = UDim2.new(0.0991038159, 0, 0.11084491, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {}),

		["Amount"] = React.createElement("TextLabel", {
			FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
			TextSize = 14,
			Size = UDim2.new(0.141667634, 0, 0.162858352, 0),
			TextColor3 = Color3.fromRGB(0, 91, 175),
	
			Text = "x5",
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.772821665, 0, 0.747967541, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextWrap = true,
		}, {}),

		["Counter"] = React.createElement("Frame", {
	
			BackgroundTransparency = 1,
			Position = UDim2.new(0.0707937703, 0, 0.77696228, 0),
			Size = UDim2.new(0.252436697, 0, 0.135120064, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {
			["Subtract"] = React.createElement("TextButton", {
				FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
				TextSize = 14,
				Size = UDim2.new(0.336490512, 0, 0.857137978, 0),
				TextColor3 = Color3.fromRGB(205, 0, 58),
		
				Text = "-",
				FontSize = Enum.FontSize.Size14,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.000260470202, 0, -0.0401742086, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextWrap = true,
			}, {}),

			["Add"] = React.createElement("TextButton", {
				FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
				TextSize = 14,
				Size = UDim2.new(0.341738254, 0, 0.857141376, 0),
				TextColor3 = Color3.fromRGB(205, 0, 58),
				Text = "+",
				FontSize = Enum.FontSize.Size14,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.762061298, 0, -0.0401778892, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextWrap = true,
			}, {}),

			["Number"] = React.createElement("TextLabel", {
				FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
				TextSize = 14,
				Size = UDim2.new(0.314007193, 0, 0.989547551, 0),
				TextColor3 = Color3.fromRGB(0, 91, 175),
				Text = "2",
				FontSize = Enum.FontSize.Size14,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.349999994, 0, -0.0942751989, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextWrap = true,
			}, {}),

			["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
				AspectRatio = 2.2899999618530273,
			}, {}),
		}),

		["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1.1299999952316284,
		}, {}),
	})
end

local function createInnerTab(props)
	return React.createElement("ScrollingFrame", {
		Visible = props.Visible,
		ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		Position = UDim2.new(-0.0469999984, 0, 0.134000003, 0),
		Size = UDim2.new(1.06700003, 0, 0.838999987, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	},{
		[1] = createItemIcon(props.categoryName),
		[2] = createItemIcon(props.categoryName),
		[3] = createItemIcon(props.categoryName),
		[4] = createItemIcon(props.categoryName),
		["UIGridLayout"] = React.createElement("UIGridLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			CellSize = UDim2.new(0.319999993, 0, 0.100000001, 0),
			CellPadding = UDim2.new(0.0170000009, 0, 0.00499999989, 0),
		}, {})
	})
end

local function CategoryButton(props)
	local onClick = React.useCallback(function()
		props.setTab(props.categoryName)
	end, {props.setTab, props.categoryName})
	
	return React.createElement("ImageButton", {
		ScaleType = Enum.ScaleType.Fit,
		Visible = true,
		HoverImage = "rbxassetid://139453088766137",
		Size = UDim2.new(0.535293043, 0, 0.0743052289, 0),
		BackgroundTransparency = 1,
		Position = props.position,
		Image = "rbxassetid://101385383771304",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		[React.Event.Activated] = onClick
	}, {
		["TextLabel"] = React.createElement("TextLabel", {
			FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
			TextSize = 14,
			Size = UDim2.new(0.551451445, 0, 0.41802147, 0),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			Text = props.categoryName,
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.22211504, 0, 0.210590929, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextWrap = true,
		}, {}),
	})
end

return function(props)
	local currentTab, setTab = React.useState("TOOLS")
	return React.createElement("Frame", {
		ZIndex = 2,
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		["Header"] = React.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = UDim2.new(0.777999997, 0, 0.0250463821, 0),
			Size = UDim2.new(0.224999994, 0, 0.0695732832, 0),
			ZIndex = 2,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {
			["HeaderBG"] = React.createElement("ImageLabel", {
				ScaleType = Enum.ScaleType.Fit,
				Image = "rbxassetid://104739546753206",
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			}, {}),

			["Close"] = React.createElement("ImageButton", {
				ScaleType = Enum.ScaleType.Fit,
				Image = "rbxassetid://96227766790838",
				BackgroundTransparency = 1,
				Position = UDim2.new(0.858796299, 0, 0.146666661, 0),
				Size = UDim2.new(0.120370373, 0, 0.693333328, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				[React.Event.Activated] = props.InventoryToggleState.disable
			}, {}),

			["InventoryText"] = React.createElement("TextLabel", {
				FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
				TextSize = 14,
				Size = UDim2.new(0.678256273, 0, 0.616077781, 0),
				TextColor3 = Color3.fromRGB(255, 255, 255),
				Text = "INVENTORY",
				FontSize = Enum.FontSize.Size14,
				TextWrapped = true,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.0925925896, 0, 0.173333332, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				TextScaled = true,
				TextWrap = true,
			}, {}),

			["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
				AspectRatio = 5.710000038146973,
			}, {}),
		}),

		["InventoryTab"] = React.createElement("Frame", {

			BackgroundTransparency = 1,
			Position = UDim2.new(0.0299999993, 0, 0.0565862693, 0),
			Size = UDim2.new(0.347916663, 0, 0.92949909, 0),
			ZIndex = 2,
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}, {
			["ToolsCategory"] = React.createElement(CategoryButton,{
				categoryName = "TOOLS",
				position = UDim2.fromScale(-0.052, 0.041),
				setTab = setTab
			}),

			["PlaceablesCategory"] = React.createElement(CategoryButton,{
				categoryName = "PLACEABLES",
				position = UDim2.fromScale(0.493, 0.041),
				setTab = setTab
			}),

			["PlaceablesInnerTabs"] = React.createElement(createInnerTab,{
				categoryName = "Placeable",
				Visible = currentTab == "PLACEABLES"
			}),

			["ToolsInnerTabs"] = React.createElement(createInnerTab,{
				categoryName ="Tool",
				Visible = currentTab == "TOOLS"
			}),

			["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
				AspectRatio = 0.6599999666213989,
			}, {}),

			["InventoryTabBackground"] = React.createElement("ImageLabel", {
				ScaleType = Enum.ScaleType.Fit,
				ZIndex = 0,
				Transparency = 1,
				Image = "rbxassetid://76171404033584",
				BackgroundTransparency = 1,
				Position = UDim2.new(-0.0913173482, 0, -0.00514681078, 0),
				Size = UDim2.new(1.15495908, 0, 1.02810085, 0),
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			}, {}),
		}),

		["BlackTransparentScreen"] = React.createElement("Frame", {
			ZIndex = 1,
			BackgroundTransparency = 0.30000001192092896,

			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		}, {}),
	})
end