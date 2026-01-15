local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Types = require(ServerStorage.AyoFramework.Types)
local React = require(ReplicatedStorage.Packages.React)

export type ContextValue = {
    AddItem: (ayoKey:string)->();
    RemoveItem: (ayoKey:string)->();
};

local InventoryItemsContext = React.createContext({})

local function InventoryItemsContextProvider(props)
    local items = {}

    function items.AddItem()
        
    end

    return React.createElement(InventoryItemsContext.Provider,{
        value = items
    }, props.children)
end

return{
    Context = InventoryItemsContext;
    Provider = InventoryItemsContextProvider;
}