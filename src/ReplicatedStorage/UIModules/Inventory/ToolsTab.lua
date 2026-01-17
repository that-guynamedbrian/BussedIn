local ReplicatedStorage = game:GetService("ReplicatedStorage")


local React = require(ReplicatedStorage.Packages.React)
local BackpackItemsContext = require(ReplicatedStorage.UIModules.Contexts.BackpackItemsContext)
local HotbarItemsContext = require(ReplicatedStorage.UIModules.Contexts.HotbarItemsContext)

local function ItemIcon(props)
	local hotbarItems:HotbarItemsContext.ContextValue = React.useContext(HotbarItemsContext.Context)
	
	local toggleHotbarItem = React.useCallback(function()
		for _, tuple in hotbarItems do
			if tuple.Item.AyoKey == props.tool.AyoKey then
				tuple.ChangeItem(nil)
				return
			end
		end
		for _, tuple in hotbarItems do
			if tuple.Item == nil then
				tuple.ChangeItem(props.tool)
				return
			end
		end
	end, {hotbarItems, props.tool, props.ayoKey})
	print(props.tool)
	return React.createElement("ImageButton", {
		ScaleType = Enum.ScaleType.Fit,

		HoverImage = "rbxassetid://82913695333014",
		Size = UDim2.new(0.156494528, 0, 0.113507375, 0),
		BackgroundTransparency = 1,
		Image = "rbxassetid://120763253309763",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		[React.Event.Activated] = toggleHotbarItem
	}, {
		["ImageLabel"] = React.createElement("ImageLabel", {
			ScaleType = Enum.ScaleType.Fit,
			Image = props.instance.TextureId,
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
			Text = props.instance:GetAttribute("name"),
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Position = UDim2.new(0.0708594769, 0, 0.0297252201, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
			TextScaled = true,
			TextWrap = true,
		}, {}),
		
		--[[["Delete"] = React.createElement("ImageButton", {
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
		}),]]

		["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
			AspectRatio = 1.1299999952316284,
		}, {}),
	})
end

local function createInnerTab(props)
	local backpack = React.useContext(BackpackItemsContext.Context)
	local icons = {}

	for ayoKey, items in backpack:GetChildren() do
		if items[1] and items[1]:GetAttribute("ayoType") == "Tool" then
			table.insert(icons, React.createElement(ItemIcon,{
				ayoKey = ayoKey;
				instance = items[1];
			}))
		end
	end

	return React.createElement("ScrollingFrame", {
		Visible = props.Visible,
		ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
		ScrollBarThickness = 0,
		BackgroundTransparency = 1,
		Position = UDim2.new(-0.0469999984, 0, 0.134000003, 0),
		Size = UDim2.new(1.06700003, 0, 0.838999987, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	},{
		React.createElement(React.Fragment, nil, icons),

		["UIGridLayout"] = React.createElement("UIGridLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			CellSize = UDim2.new(0.319999993, 0, 0.100000001, 0),
			CellPadding = UDim2.new(0.0170000009, 0, 0.00499999989, 0),
		}, {})
	})
end

return createInnerTab;
