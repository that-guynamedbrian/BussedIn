local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local Inventory = require(ReplicatedStorage.UIModules.Inventory)
local MainHUD = require(ReplicatedStorage.UIModules.MainHUD)
local ReactUtils = require(ReplicatedStorage.Utils.ReactUtils)

return function()
    local props = {
        HUDToggleState = ReactUtils.useToggleState(true);
        InventoryToggleState = ReactUtils.useToggleState(false);
    }

    return React.createElement(React.Fragment, nil, {
        UIStroke = React.createElement("UIStroke"),
        MainHUD = props.HUDToggleState.on and React.createElement(MainHUD, props),
        Inventory = props.InventoryToggleState.on and React.createElement(Inventory, props)
    })
end
