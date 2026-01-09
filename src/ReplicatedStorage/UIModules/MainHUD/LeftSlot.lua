local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local function ButtonIcon(imageid:string, position:UDim2, activatedFunc:((any)->any)?)
    return React.createElement("ImageButton", {
		ScaleType = Enum.ScaleType.Fit,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.920833826, 0, 0.172290221, 0),
		Image = imageid,
		BackgroundTransparency = 1,
		Position = position,
		ZIndex = 11,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        [React.Event.MouseButton1Click] = activatedFunc
	}, {})
end

return function(props)
    return React.createElement("Frame", {
        AnchorPoint = Vector2.new(0,0.5),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.0109999999, 0, 1-0.333999991, 0),
        Size = UDim2.new(0.0710000023, 0, 0.644999981, 0),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        UIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint",{
            AspectRatio = 0.0710000023/0.644999981 * 16/9
        }),

        ["NPC"] = ButtonIcon("rbxassetid://105665850741368", UDim2.new(0.0364963487, 0, 0.00682601379, 0)),

        ["Inventory"] = ButtonIcon("rbxassetid://123467898068713", UDim2.new(0.0364963487, 0, 0.656047106, 0), function()
            props.setInventoryEnabled(true)
        end),

        ["Avatar"] = ButtonIcon("rbxassetid://104956935339886", UDim2.new(0.0364963487, 0, 0.817689836, 0)),

        ["Transport"] = ButtonIcon("rbxassetid://139449258354411", UDim2.new(0.0364963487, 0, 0.168468803, 0)),

        ["Anim"] = ButtonIcon("rbxassetid://95936900854248", UDim2.new(1.85060084, 0, -0.493665069, 0)),

        ["BG"] = React.createElement("ImageLabel", {
            ScaleType = Enum.ScaleType.Fit,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Image = "rbxassetid://116561793149912",
            BackgroundTransparency = 1,
            Position = UDim2.new(-0.124087594, 0, -0.0237720963, 0),
            Size = UDim2.new(1.24461174, 0, 1.04535484, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {})
    })
end