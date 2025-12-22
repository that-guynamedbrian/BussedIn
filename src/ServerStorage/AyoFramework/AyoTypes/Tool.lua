local HttpService = game:GetService("HttpService");
local ServerScriptService = game:GetService("ServerScriptService");
local ServerStorage = game:GetService("ServerStorage");
local Pickupable = require(script.Parent.Pickupable);
local AvailableItems = require(ServerScriptService.AyoFramework.AvailableItems);
local Types = require(ServerStorage.AyoFramework.Types);

local Tool = {};

function Tool:__index(index:string)
   if Tool[index] then
      return Tool[index];
   elseif Pickupable[index] then
      return Pickupable[index];
   elseif rawget(self, index) then
      return rawget(self, index);
   elseif self.instance[index] then
      return self.instance[index];
   else
      return nil;
   end
end

function Tool.new(ayoKey:string)
   assert(typeof(ayoKey) == "string", "Invalid parameter 'ayoKey', must be of type string");
   local rootInstance = AvailableItems.Tools[ayoKey];

   local self:Types.ToolAyo = {
      Instance = rootInstance;
      AyoType = "Tool";
      AyoKey = ayoKey;
      UnitKey = HttpService:GenerateGUID(false);

      Activate = require(rootInstance:FindFirstChild("Activate"));
   }

   return setmetatable(self, Tool);
end

return Tool::{
   new: (ayoKey:string)->(Types.ToolAyo);
};
