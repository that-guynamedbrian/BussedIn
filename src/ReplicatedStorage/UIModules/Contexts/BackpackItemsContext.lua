local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReplicaClient = require(ReplicatedStorage.ReplicaClient)

export type ContextValue = {
    [string]: Instance
};

local BackpackItemsContext = React.createContext({})

local function BackpackItemsContextProvider(props)
    local replica:ReplicaClient.Replica = props
    local backpack, setBackpack = React.useState(replica.Data)
    replica:OnSet({"Backpack"}, function()
        setBackpack(replica.Data);
    end);
    return React.createElement(BackpackItemsContext.Provider,{
        value = backpack
    }, props.children)
end

return{
    Context = BackpackItemsContext;
    Provider = BackpackItemsContextProvider;
}