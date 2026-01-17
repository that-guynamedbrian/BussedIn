local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local Character = require(ServerStorage.AyoFramework.AyoTypes.Character)
local RootUI = require(script.Parent.RootUI)
local React = require(ReplicatedStorage.Packages.React)
local ReactRoblox = require(ReplicatedStorage.Packages.ReactRoblox)
local UILabs = require(ReplicatedStorage.Packages.UILabs)

local story = {
    react = React;
    reactRoblox = ReactRoblox;
    story = function(props)
        local charinfo = Players:CreateHumanoidModelFromUserIdAsync(1151905092)
        local char =  Character.new(charinfo)
        
        local janitor = UILabs.Environment.GetJanitor()
        janitor:Add(char.Instance)
        janitor:Add(char.Backpack)
        janitor:Add(char.Inventory)
        
        return React.createElement(RootUI, {
            backpackReplica = {
                Data = char
            }
        })
    end;
}

return story