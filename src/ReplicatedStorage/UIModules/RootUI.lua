local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local BackpackItemsContext = require(ReplicatedStorage.UIModules.Contexts.BackpackItemsContext)
local GlobalUIContext = require(ReplicatedStorage.UIModules.Contexts.GlobalUIContext)
local HotbarItemsContext = require(ReplicatedStorage.UIModules.Contexts.HotbarItemsContext)
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

return function(props)
    print("a")
    return React.createElement(GlobalUIContext.Provider, {
        value = {
            HUDToggleState = ReactUtils.useToggleState(true);
            InventoryToggleState = ReactUtils.useToggleState(false);
            CharReplica = props.backpackReplica;
        };
        children = React.createElement(BackpackItemsContext.Provider, {
            value = props.backpackReplica;
            children = React.createElement(HotbarItemsContext.Provider, {
                value = {
                    Items = {};
                };
                children = React.createElement(MainUIs);
            });
        });
    });
end
