local AccountService = game:GetService("AccountService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local Inventory = require(ReplicatedStorage.UIModules.Inventory)
local MainHUD = require(ReplicatedStorage.UIModules.MainHUD)

return function()
    local HUDEnabled, setHUDEnabled = React.useState(true)
    local InventoryEnabled, setInventoryEnabled = React.useState(false)
    
    local globalprops = {
        HUDEnabled = HUDEnabled;
        setHUDEnabled = setHUDEnabled;
        InventoryEnabled = InventoryEnabled;
        setInventoryEnabled = setInventoryEnabled;
    }

    return React.createElement("Frame",{
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1
    },{
        MainHUD = HUDEnabled and React.createElement(MainHUD, globalprops),
        Inventory = InventoryEnabled and React.createElement(Inventory, globalprops)
    })
end
