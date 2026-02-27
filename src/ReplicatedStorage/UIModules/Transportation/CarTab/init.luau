local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)

return function(props)

    return React.createElement("ScrollingFrame", {
        ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
        Active = true,
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        ScrollBarThickness = 0,
        BackgroundTransparency = 1,
        Position = UDim2.new(0.0309999995, 0, 0.107000001, 0),
        Size = UDim2.new(0.94599998, 0, 0.879000008, 0),
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        ["InnerTab"] = React.createElement("ImageButton", {
            ScaleType = Enum.ScaleType.Fit,
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            HoverImage = "rbxassetid://114712576795503",
            BackgroundTransparency = 1,
            Size = UDim2.new(0.156494528, 0, 0.113507375, 0),
            Image = "rbxassetid://88954328900039",
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            ["ImageLabel"] = React.createElement("ImageLabel", {
                ScaleType = Enum.ScaleType.Fit,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Image = "rbxasset://textures/ui/GuiImagePlaceholder.png",
                BackgroundTransparency = 1,
                Position = UDim2.new(0.232077718, 0, 0.162858412, 0),
                Size = UDim2.new(0.527449369, 0, 0.493510336, 0),
                BorderSizePixel = 0,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            }, {}),
        }),

        ["UIGridLayout"] = React.createElement("UIGridLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            CellSize = UDim2.new(0.300000012, 0, 0.100000001, 0),
            CellPadding = UDim2.new(0.0500000007, 0, 0.00999999978, 0),
        }, {}),

        ["UIAspectRatioConstraint"] = React.createElement("UIAspectRatioConstraint", {
            AspectRatio = 0.7099999785423279,
        }, {}),
    })
end