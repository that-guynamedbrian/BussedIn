local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MainHUD = require(script.Parent.MainHUD)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)


return function(parent)
    local root = ReactRoblox.createRoot(parent)
    local app = React.createElement("ScreenGui",{})
    root:render(app)

    return function()
        root:unmount()
    end
end