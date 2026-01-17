local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local HotbarItemsContext = require(ReplicatedStorage.UIModules.Contexts.HotbarItemsContext)

return function(props)
    local hotbarItemState = React.useContext(HotbarItemsContext.Context)
    print(hotbarItemState[props.index])
    local activatedFunc = React.useCallback(function()

    end, {})
    return React.createElement("ImageButton", {
        ScaleType = Enum.ScaleType.Fit,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Image = "rbxassetid://117567947418404",
        BackgroundTransparency = 1,
        Size = UDim2.new(0.0946291313, 0, 1.07809818, 0),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        [React.Event.Activated] = activatedFunc
    }, {
        
        ["TextLabel"] = React.createElement("TextLabel", {
            FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
            TextSize = 14,
            Size = UDim2.new(0.316953003, 0, 0.284741104, 0),
            TextColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Text = "+",
            FontSize = Enum.FontSize.Size14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            Position = UDim2.new(0, 0, 0.0898278803, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            TextScaled = true,
            TextWrap = true,
        }, {}),
        

        ["ImageLabel"] = (hotbarItemState[props.index].Item ~= nil) and React.createElement("ImageLabel", {
            ScaleType = Enum.ScaleType.Fit,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Image = hotbarItemState[props.index].Item.TextureId,
            BackgroundTransparency = 1,
            Position = UDim2.new(0.130262032, 0, 0.272099227, 0),
            
            Size = UDim2.new(0.714142084, 0, 0.552284062, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {}),
    })
end
