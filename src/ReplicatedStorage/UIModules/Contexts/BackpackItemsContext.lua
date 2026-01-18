local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local ReplicaClient = require(ReplicatedStorage.ReplicaClient)

export type ContextValue = {
    [string]: Instance
};

local BackpackItemsContext = React.createContext({})

local function BackpackItemsContextProvider(props)
    local replica:ReplicaClient.Replica = props.value
    local getChildrenDict = React.useCallback(function(children:{[number]:Instance})
        local dict = {}
        for _, instance in children do
            dict[instance.Name] = instance
        end
        return dict
    end)

    local backpack, setBackpack = React.useState(getChildrenDict(replica.Data.Backpack:GetChildren()))
    
    local updateBackpack = React.useCallback(function()
        setBackpack(getChildrenDict(replica.Data.Backpack:GetChildren()))
    end, {props.value})
    
    replica.Data.Backpack.DescendantAdded:Connect(updateBackpack)
    replica.Data.Backpack.DescendantRemoving:Connect(updateBackpack)
    
    return React.createElement(BackpackItemsContext.Provider,{
        value = backpack
    }, props.children)
end

return{
    Context = BackpackItemsContext;
    Provider = BackpackItemsContextProvider;
}