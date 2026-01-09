local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local Inventory = require(ReplicatedStorage.UIModules.Inventory)
local MainHUD = require(ReplicatedStorage.UIModules.MainHUD)

return function()
    local HUDEnabled, setHUDEnabled = React.useState(true)
    local InventoryEnabled, setInventoryEnabled = React.useState(false)
    
    local globalprops = {
        HUDEnabled = HUDEnabled;
        setHUDEnabled = setHUDEnabled;
        InventoryEnabled = InventoryEnabled;
        setInventoryEnabled = setInventoryEnabled;
    }

    return React.createElement(React.Fragment, nil, {
        UIStroke = React.createElement("UIStroke"),
        MainHUD = HUDEnabled and React.createElement(MainHUD, globalprops),
        Inventory = InventoryEnabled and React.createElement(Inventory, globalprops)
    })
end
