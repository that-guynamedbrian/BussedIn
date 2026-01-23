local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)

local HotbarItemsContext = React.createContext({})

local function HotbarItemsContextProvider(props)
    local items = {}
    
    for i = 1, 10 do
        local hotbarItemState = {React.useState(props.value.Items[i] or nil)};
        items[i] = {
            Item = hotbarItemState[1];
            ChangeItem = hotbarItemState[2];
        }
    end
    return React.createElement(HotbarItemsContext.Provider,{
        value = items
    }, props.children)
end

return{
    Context = HotbarItemsContext;
    Provider = HotbarItemsContextProvider;
}