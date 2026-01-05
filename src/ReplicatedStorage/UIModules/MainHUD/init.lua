local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UIMaid = require(ReplicatedStorage.UIModules.UIMaid)

return function(HUDRoot:ScreenGui)
	local HUDRoot = game:GetService("ReplicatedStorage").UserInterface.MainHUD -- delete this line 
	local buttonsFrame = HUDRoot.LeftButtonsFrame;
	
	local inventoryButton = buttonsFrame.Inventory;
	inventoryButton.Activated:Connect(require(script.Inventory))
end
