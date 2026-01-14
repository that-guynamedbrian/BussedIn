local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GlobalUIContext = require(script.Parent.GlobalUIContext)
local React = require(ReplicatedStorage.Packages.React)
local Inventory = require(ReplicatedStorage.UIModules.Inventory)
local MainHUD = require(ReplicatedStorage.UIModules.MainHUD)
local ReactUtils = require(ReplicatedStorage.Utils.ReactUtils)

local function MainUIs(props)
    local globals = React.useContext(GlobalUIContext.Context)
    return React.createElement(React.Fragment,nil, {
        UIStroke = React.createElement("UIStroke"),
        MainHUD = globals.HUDToggleState.on and React.createElement(MainHUD),
        Inventory = globals.InventoryToggleState.on and React.createElement(Inventory)
    })
end

return function()
    return React.createElement(GlobalUIContext.Provider, {
        value = {
            HUDToggleState = ReactUtils.useToggleState(true);
            InventoryToggleState = ReactUtils.useToggleState(false);
        };
        children = React.createElement(MainUIs)
    })
end
