local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VisibilityCheckDispatcher = game:GetService("VisibilityCheckDispatcher")

local React = require(ReplicatedStorage.Packages.React)

local HotbarIcon = React.Component:extend("HotbarIcon")

HotbarIcon.defaultProps = {
    Visible = true
}

function HotbarIcon:sh()
    
end

function HotbarIcon:render()
    return React.createElement("ImageButton", {
        ScaleType = Enum.ScaleType.Fit,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Image = "rbxassetid://117567947418404",
        BackgroundTransparency = 1,
        Position = UDim2.new(0.000689181499, 0, -0.0406924374, 0),
        Size = UDim2.new(0.0946291313, 0, 1.07809818, 0),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
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

        ["ImageLabel"] = React.createElement("ImageLabel", {
            ScaleType = Enum.ScaleType.Fit,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Image = "rbxassetid://107412950382588",
            BackgroundTransparency = 1,
            Position = UDim2.new(0.130262032, 0, 0.272099227, 0),
            
            Size = UDim2.new(0.714142084, 0, 0.552284062, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {}),
    })
end

return HotbarIcon