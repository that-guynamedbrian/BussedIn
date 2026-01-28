local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local ReactUtils = require(ReplicatedStorage.Utils.ReactUtils)


export type ContextValue = {
    PlacementGhost:Model;
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

local function ghostify(model)
    
end

local function PlacementContextProvider(props)
    local ghost:Model = props.model
    local transparencies = React.useMemo(function()
        local tbl = {}  
        for _, instance in ghost:GetDescendants() do
            if instance:IsA("BasePart") then
                tbl[instance.Name] = instance.Transparency
            end
        end
        return tbl
    end,{ghost})
    local ghostify = React.useCallback(function(deghostify:boolean)
        for _, instance in ghost:GetChildren() do
            if not instance:IsA("BasePart") then continue end
            instance.Transparency = transparencies[instance.Name] - (deghostify and 0.5 or 1)
        end
    end,{ghost, transparencies})

    return React.createElement(PlacementContext.Provider,{

    })
end
