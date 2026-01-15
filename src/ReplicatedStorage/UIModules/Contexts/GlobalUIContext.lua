local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local ReactUtils = require(ReplicatedStorage.Utils.ReactUtils)

export type GlobalUIContext = {
    HUDToggleState: ReactUtils.toggleState;
    InventoryToggleState: ReactUtils.toggleState;
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
})

local function GlobalUIContextProvider(props)
    local HUDToggleState = ReactUtils.useToggleState(true)
    local InventoryToggleState = ReactUtils.useToggleState(false)
    
    local value = {
        HUDToggleState = HUDToggleState;
        InventoryToggleState = InventoryToggleState;
    }
    
    return React.createElement(GlobalUIContext.Provider, {
        value = value
    }, props.children)
end

return {
    Context = GlobalUIContext :: GlobalUIContext;
    Provider = GlobalUIContextProvider;
}