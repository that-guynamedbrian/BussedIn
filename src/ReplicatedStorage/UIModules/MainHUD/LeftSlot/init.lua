local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local GlobalUIContext = require(ReplicatedStorage.UIModules.Contexts.GlobalUIContext)

local positionIndex = -1
local function nextposition()
    positionIndex += 1
    return UDim2.fromScale(0.0679551437,0.0168145858+positionIndex*(0.173630476-0.0168145858))
end

local function ButtonIcon(imageid:string, activatedFunc:((any)->any)?)
    return React.createElement("ImageButton", {
		ScaleType = Enum.ScaleType.Fit,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Size = UDim2.new(0.854799926, 0, 0.16714561, 0),
		Image = imageid,
		BackgroundTransparency = 1,
		Position = nextposition(),
		ZIndex = 11,
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        [React.Event.Activated] = activatedFunc
	}, {})
end

return function()
    local globals: GlobalUIContext.ContextValue = React.useContext(GlobalUIContext.Context)
    positionIndex = -1
    return React.createElement("ImageLabel", {
        ScaleType = Enum.ScaleType.Fit,
        Image = "rbxassetid://116561793149912",
        AnchorPoint = Vector2.new(0,2),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        Position = UDim2.new(-0.02, 0, 1, 0),
        Size = UDim2.new(0.133, 0, 0.706, 0),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        --UIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint",{
        --}),

        ["NPC"] = ButtonIcon("rbxassetid://105665850741368"),

        ["Inventory"] = ButtonIcon("rbxassetid://123467898068713", globals.InventoryToggleState.enable),

        ["Avatar"] = ButtonIcon("rbxassetid://104956935339886"),

        ["Transport"] = ButtonIcon("rbxassetid://139449258354411", globals.TransportationToggleState.enable),

        ["Shop"] = ButtonIcon("rbxassetid://123467898068713"),

        ["Anim"] = React.createElement("ImageButton", {
            ScaleType = Enum.ScaleType.Fit,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(0.456259668, 0, 0.0788352787, 0),
            Image = "rbxassetid://95936900854248",
            BackgroundTransparency = 1,
            Position = UDim2.new(1.76769769, 0, -0.401803881, 0),
            ZIndex = 11,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	    }, {})
    })
end