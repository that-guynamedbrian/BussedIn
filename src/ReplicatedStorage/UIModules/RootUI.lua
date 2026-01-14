local ProximityPromptService = game:GetService("ProximityPromptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local GlobalUIContext = require(script.Parent.GlobalUIContext)
local React = require(ReplicatedStorage.Packages.React)
local Inventory = require(ReplicatedStorage.UIModules.Inventory)
local MainHUD = require(ReplicatedStorage.UIModules.MainHUD)

return function()
    local globals  = React.useContext(GlobalUIContext)
    print(globals)
    print(GlobalUIContext)
    return React.createElement(React.Fragment, nil, {
        UIStroke = React.createElement("UIStroke"),
        MainHUD = globals.HUDToggleState.on and React.createElement(MainHUD),
        Inventory = globals.InventoryToggleState.on and React.createElement(Inventory)
    })
end
