local HttpService = game:GetService("HttpService");
local ServerScriptService = game:GetService("ServerScriptService");
local Pickupable = require(script.Parent.Pickupable);
local AvailableItems = require(ServerScriptService.AyoFramework.AvailableItems);

---@class ToolAyo:PickupableAyo
---@field Instance Tool
---@field AyoType "Tool"
local staticFields = {
   AyoType = "Tool";
   Held = nil;
   HeldBy = nil;
   Equip = Pickupable.Equip;
   Unequip = Pickupable.Unequip;
   ---comment
   ---@param self ToolAyo
   Activate = function(self)
      require(self.Instance:FindFirstChild("Activate"))();
   end;
};

local Tool = {};

function Tool.new(ayoKey:string)
   assert(typeof(ayoKey) == "string", "Invalid parameter 'ayoKey', must be of type string");
   local rootInstance = AvailableItems.Tools[ayoKey];

   ---@type ToolAyo
   local self = {
      Instance = rootInstance;
      AyoKey = ayoKey;
      UnitKey = HttpService:GenerateGUID(false);

      Activate = require(rootInstance:FindFirstChild("Activate"));
   }

   for name, field in staticFields do
      self[name] = field;
   end

   return self;
end

return Tool;