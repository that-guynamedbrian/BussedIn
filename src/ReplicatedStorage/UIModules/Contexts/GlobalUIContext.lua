local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Types = require(ReplicatedStorage.AyoFramework.Types)
local React = require(ReplicatedStorage.Packages.React)
local ReactUtils = require(ReplicatedStorage.Utils.ReactUtils)

export type ContextValue = {
    HUDToggleState: ReactUtils.toggleState;
    InventoryToggleState: ReactUtils.toggleState;
    PlacementToggleState: ReactUtils.toggleState;
    Character: Types.CharacterAyo;
}

local toggleState = {
    on = true;
    enable = function() end;
    disable = function() end;
    toggle = function() end;
}

local GlobalUIContext = React.createContext({
    HUDToggleState = toggleState;
    InventoryToggleState = toggleState;
    PlacementToggleState = toggleState;
    Character = {};
})

local function GlobalUIContextProvider(props)
    local HUDToggleState = ReactUtils.useToggleState(true)
    local InventoryToggleState = ReactUtils.useToggleState(false)
    local PlacementToggleState = ReactUtils.useToggleState(false)
    
    local value = {
        HUDToggleState = HUDToggleState;
        InventoryToggleState = InventoryToggleState;
        PlacementToggleState = PlacementToggleState;
        Character = props.value.CharReplica.Data;
    }
    
    return React.createElement(GlobalUIContext.Provider, {
        value = value
    }, props.children)
end

return {
    Context = GlobalUIContext;
    Provider = GlobalUIContextProvider;
}