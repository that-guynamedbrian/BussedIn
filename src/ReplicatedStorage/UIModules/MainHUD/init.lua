local ReplicatedStorage = game:GetService("ReplicatedStorage");
local Roact = require(ReplicatedStorage.Packages.roact);

local LeftSlot = require(script.LeftSlot);
local Hotbar = require(script.Hotbar);
local TopRight = require(script.TopRight);

return Roact.createElement("ScreenGui", {}, {
	LeftButtonsFrame = LeftSlot(),
	SlotFrame = Hotbar(),
	TopRightFrame = TopRight(),
})
