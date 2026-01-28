local HttpService = game:GetService("HttpService");
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService");

local Types = require(ReplicatedStorage.AyoFramework.Types)
local Pickupable = require(script.Parent.Pickupable);
local AvailableItems = require(ServerScriptService.AyoFramework.AvailableItems);

local Tool = {
   AyoType = "Tool";
   Equip = Pickupable.Equip;
   Unequip = Pickupable.Unequip;
   Pickup = Pickupable.Pickup;
   Remove = Pickupable.Remove;
};
Tool.__index = Tool;

local toolsCache = {}

function Tool.new(ayoKey:string)
   assert(typeof(ayoKey) == "string", "Invalid parameter 'ayoKey', must be of type string");
   
   local rootInstance = AvailableItems.Tools[ayoKey]:Clone()::Tool;
   local activatedModule = rootInstance:FindFirstChild("Activate")::ModuleScript;
   local activatedFunc = require(activatedModule);
   activatedModule:Destroy();

   local self = {
      Name = rootInstance.Name;
      Instance = rootInstance;
      AyoKey = ayoKey;
      UnitKey = HttpService:GenerateGUID(false);
      Activate = activatedFunc;
   } :: Types.ToolAyo;

   rootInstance:SetAttribute("ayoType", Tool.AyoType);
   rootInstance:SetAttribute("ayoKey", ayoKey);
   rootInstance:SetAttribute("unitKey", self.UnitKey);
   rootInstance:SetAttribute("name", rootInstance.Name);
   rootInstance.Activated:Connect(function()
      activatedFunc(self, self.HeldBy);
   end);

   toolsCache[self.UnitKey] = self;
   return setmetatable(self, Tool);
end

function Tool.fromUnitKey(unitKey:string)
   return toolsCache[unitKey];
end

return Tool;