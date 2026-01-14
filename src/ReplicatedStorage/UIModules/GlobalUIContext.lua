local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local ReactUtils = require(ReplicatedStorage.Utils.ReactUtils)


local globalContext; globalContext = React.createContext({
    HUDToggleState = {
        on = true;
        enable = function()
            React.useContext(globalContext).HUDToggleState.on = true
        end,
        disable = function()
            React.useContext(globalContext).HUDToggleState.on = false
        end
    };
    InventoryToggleState = {
        on = false;
        enable = function()
            React.useContext(globalContext).InventoryToggleState.on = true
        end,
        disable = function()
            React.useContext(globalContext).InventoryToggleState.on = false
        end
    }
})

print(globalContext)

return globalContext