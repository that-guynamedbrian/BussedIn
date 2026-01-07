local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Roact = require(ReplicatedStorage.Packages.roact)

return function()
    local root = require(script.Parent.MainHUD)
    root:render()
    return function()
        
    end
end