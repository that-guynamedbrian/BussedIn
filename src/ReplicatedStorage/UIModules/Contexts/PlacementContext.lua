local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local ReactUtils = require(ReplicatedStorage.Utils.ReactUtils)


type ContextProps = {
    model:Model
}

export type ContextValue = {
    PlacementGhost:Model;
    ChangePlacementGhost:(Model)->();
    PlacementModeToggleState: typeof(ReactUtils.useToggleState(false));
}

local toggleState = {
    on = true;
    enable = function() end;
    disable = function() end;
    toggle = function() end;
}

local PlacementContext = React.createContext({
    PlacementGhost = nil;
    PlacementModeToggleState = toggleState 
}::ContextValue)


local function PlacementContextProvider(props:ContextProps)
    local ghost, changeGhost = React.useState(props.model)
    local toggleState = ReactUtils.useToggleState(false)
    
    local transparencies = React.useMemo(function()  
        local tbl = {}
        for _, instance in ghost:GetChildren() do
            if not instance:IsA("BasePart") then continue end
            tbl[instance] = instance.Transparency
        end
        return tbl
    end, {ghost})

    React.useEffect(function()
        for instance, transparency in transparencies do
            instance.Transparency = toggleState.on and transparency - 0.5 or transparency
        end
        return function()
            for instance, transparency in transparencies do
                instance.Transparency = transparency
            end
        end
    end, {transparencies, toggleState})

    return React.createElement(PlacementContext.Provider,{
        value = {
            PlacementGhost = ghost;
            ChangePlacementGhost = changeGhost;
            PlacementModeToggleState = toggleState;
        }::ContextValue
    })
end

return {
    Context = PlacementContext;
    ContextProvider = PlacementContextProvider;
}
