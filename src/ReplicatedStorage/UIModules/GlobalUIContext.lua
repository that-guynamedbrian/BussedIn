local ReplicatedStorage = game:GetService("ReplicatedStorage")


local React = require(ReplicatedStorage.Packages.React)

local globalContext; globalContext = React.createContext({
    HUDToggleState = true;
    InventoryToggleState = false;
})

print(globalContext)

return globalContext