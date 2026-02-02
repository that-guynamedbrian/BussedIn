local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Net = require(ReplicatedStorage.Utils.Net)
local message = "Hello World"
Net.SendAsync("port1",message)