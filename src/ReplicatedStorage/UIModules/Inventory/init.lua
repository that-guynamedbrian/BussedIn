--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")


local GlobalUIContext = require(script.Parent.GlobalUIContext)
local ToolsTab = require(script.ToolsTab)
local React = require(ReplicatedStorage.Packages.React)


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
	local globals = React.useContext(GlobalUIContext)
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
				[React.Event.Activated] = globals.InventoryToggleState.disable
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

			--[[["PlaceablesInnerTabs"] = React.createElement(nil,{
				categoryName = "Placeable",
				Visible = currentTab == "PLACEABLES"
			}),]]

			["ToolsInnerTabs"] = React.createElement(ToolsTab,{
				categoryName = "Tool",
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