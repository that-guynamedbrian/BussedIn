local ReplicatedStorage = game:GetService("ReplicatedStorage")

local HotbarIcon = require(script.HotbarIcon)
local React = require(ReplicatedStorage.Packages.React)


return function(props)
    local slots = {}
    for i=1, 10 do
        slots[i] = React.createElement(HotbarIcon,{index = i})
    end

    return React.createElement("Frame", {
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 1,
        Position = UDim2.new(0.308854163, 0, 0.907238722, 0),
        Size = UDim2.new(0.381770819, 0, 0.0732838586, 0),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        ["BG"] = React.createElement("ImageLabel", {
            ZIndex = 0,
            ScaleType = Enum.ScaleType.Fit,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Image = "rbxassetid://89385253162271",
            BackgroundTransparency = 1,
            Position = UDim2.new(-0.0204638466, 0, -0.198711157, 0),
            Size = UDim2.new(1.03965604, 0, 1.45187652, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {}),

        ["InnerSlots"] = React.createElement("Frame", {
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            BackgroundTransparency = 1,
            Position = UDim2.new(0.0113616986, 0, -0.0239250083, 0),
            Size = UDim2.new(0.967912436, 0, 0.914958715, 0),
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            ["UIListLayout"] = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                Padding = UDim.new(0.00700000022, 0),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }, {}),
            
            React.createElement(React.Fragment,nil, slots)
        }),

        ["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
            AspectRatio = 9.140000343322754,
        }, {}),
    })
end
