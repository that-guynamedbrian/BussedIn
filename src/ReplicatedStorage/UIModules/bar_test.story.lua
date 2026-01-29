local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)
local ReactUtils = require(ReplicatedStorage.Utils.ReactUtils)

local e = React.createElement

local imageContext = React.createContext("")

local function FullCorner(props)
    return e("UICorner",{
        CornerRadius = UDim.new(0.5,0)
    })
end

local function ShadeGradient(props)
    local c0, c1 = React.useMemo(function()
        local c = props.Contrast or 0.5
        return Color3.new(1, 1, 1), Color3.new(1-c, 1-c, 1-c)
    end,{props.Contrast})

    return e("UIGradient",{
        Rotation = props.Rotation or 90;
        Color = ColorSequence.new(c0,c1)
    })
end

local function BarFrame(props)
    local image = React.useContext(imageContext)
    local defaults = {
        Image = image;
        ImageColor3 = props.BackgroundColor3;
        BackgroundTransparency = (image and #image > 0) and 1 or 0;
        Size = UDim2.fromScale(1, 1);
        AnchorPoint = Vector2.new(0.5,0.5);
        Position = UDim2.fromScale(0.5, 0.5);
    }
    
    return e("ImageLabel", ReactUtils.joinProps(defaults, props), {
       -- not (image ~= nil and #image > 0) and e(FullCorner),
        props.children
    })
end

local function BarFill(props)
    return e(BarFrame,{
        Position = props.Position;
        Size = UDim2.new(UDim.new(0.95,0), UDim.new(.95,0));
        BackgroundColor3 = Color3.new(0,1,0);
    },{
        e(ShadeGradient)
    })
end

local function InnerBar(props)
    return e("Frame",{
        Size = UDim2.fromScale(1,1);
        AnchorPoint = Vector2.new(1,0.5);
        Position = UDim2.fromScale(props.Fill, 0.5);
        BackgroundTransparency = 1;
        ClipsDescendants = true;
    },{
        e(FullCorner);
        e(BarFill,{
            Position = UDim2.fromScale(1.5-props.Fill, 0.5)
        });
    })
end

local controls = {
    Fill = UILabs.Advanced.Slider(50, 0, 100,5);
    Image = UILabs.String("")
}

local story = {
    react = React;
    reactRoblox = ReactRoblox;
    controls = controls;
    story = function(props)
        return e(imageContext.Provider,{
            value = props.controls.Image
        },{
            e(BarFrame,{
                Size = UDim2.fromScale(0.8, 0.2);
            },{
                e(InnerBar,{
                    Fill = props.controls.Fill/100
                });
                e(BarFrame,{
                    ZIndex = -1;
                    Size = UDim2.new(UDim.new(.95), UDim.new(.95));
                    BackgroundColor3 = Color3.new(0,0.3,0);
                },{
                    e(ShadeGradient,{
                        Rotation = -90;
                    })
                })
            })
        })
    end;
};

local temp = "rbxassetid://13871642287"

return story;