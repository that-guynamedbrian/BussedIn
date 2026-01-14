local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RootUI = require(script.Parent.RootUI)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)


local story = {
    react = React;
    reactRoblox = ReactRoblox;
    story = function(props)
        return React.createElement(RootUI)
    end;
}

return story