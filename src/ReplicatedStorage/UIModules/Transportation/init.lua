local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BikeTab = require(script.BikeTab)
local CarTab = require(script.CarTab)
local SkateboardTab = require(script.SkateboardTab)
local TabButtons = require(script.TabButtons)
local React = require(ReplicatedStorage.Packages.React)
local GlobalUIContext = require(ReplicatedStorage.UIModules.Contexts.GlobalUIContext)

return function(props)
    local globalUIState: GlobalUIContext.ContextValue = React.useContext(GlobalUIContext.Context)
    local currentTab, setCurrentTab = React.useState("BIKE")
    print(currentTab)
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.new(1, 0, 1, 0),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        ["Header"] = React.createElement("Frame", {
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.777999997, 0, 0.0250463821, 0),
            Size = UDim2.new(0.224999994, 0, 0.0695732832, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            ["HeaderBG"] = React.createElement("ImageLabel", {
                ScaleType = Enum.ScaleType.Fit,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Image = "rbxassetid://104739546753206",
                BackgroundTransparency = 1,
                Size = UDim2.new(1, 0, 1, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            }, {}),

            ["Close"] = React.createElement("ImageButton", {
                ScaleType = Enum.ScaleType.Fit,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Image = "rbxassetid://96227766790838",
                BackgroundTransparency = 1,
                Position = UDim2.new(0.858796299, 0, 0.146666661, 0),
                Size = UDim2.new(0.120370373, 0, 0.693333328, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                [React.Event.Activated] = globalUIState.TransportationToggleState.disable
            }, {}),

            ["TransportationText"] = React.createElement("TextLabel", {
                FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                TextSize = 14,
                Size = UDim2.new(0.770848989, 0, 0.616077781, 0),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Text = "TRANSPORTATION",
                FontSize = Enum.FontSize.Size14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.0210157614, 0, 0.173333332, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                TextScaled = true,
                TextWrap = true,
            }, {}),

            ["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
                AspectRatio = 5.710000038146973,
            }, {}),
        }),

        ["Despawn"] = React.createElement("ImageButton", {
            ScaleType = Enum.ScaleType.Fit,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(0.144270837, 0, 0.057513915, 0),
            Image = "rbxassetid://131667870202612",
            BackgroundTransparency = 1,
            Position = UDim2.new(0.851666629, 0, 0.931241155, 0),

            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            ["TextLabel"] = React.createElement("TextLabel", {
                FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                TextSize = 14,
                Size = UDim2.new(0.758122742, 0, 0.610433221, 0),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Text = "DESPAWN",
                FontSize = Enum.FontSize.Size14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                Position = UDim2.new(0.119133577, 0, 0.0500010923, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                TextScaled = true,
                TextWrap = true,
            }, {}),

            ["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
                AspectRatio = 4.570000171661377,
            }, {}),
        }),

        ["TransportationTab"] = React.createElement("Frame", {
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.00600000005, 0, 0.0565862693, 0),
            Size = UDim2.new(0.347916663, 0, 0.92949909, 0),
            ZIndex = 2,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {

            React.createElement(TabButtons, {
                setCurrentTab = setCurrentTab;
            }),
            SkateboardTab =  (currentTab == "SKATEBOARD") and React.createElement(SkateboardTab),
            CarTab =  (currentTab == "CAR") and React.createElement(CarTab),
            BikeTab = (currentTab == "BIKE") and React.createElement(BikeTab),

            ["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
                AspectRatio = 0.6599999666213989,
            }, {}),
            
            ["BG"] = React.createElement("ImageLabel", {
                ZIndex = 0,
                ScaleType = Enum.ScaleType.Fit,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Image = "rbxassetid://78995200826936",
                BackgroundTransparency = 1,
                Position = UDim2.new(-0.0913173631, 0, -0.0232719369, 0),
                Size = UDim2.new(1.18123353, 0, 1.04622602, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            }, {})
        }),

        ["BlackTransparentScreen"] = React.createElement("Frame", {
            BackgroundTransparency = 0.30000001192092896,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(1, 0, 1, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        }, {}),
    })
end