local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ServerStorage = game:GetService("ServerStorage");

local Net = require(ReplicatedStorage.Utils.Net)
local AyoFolder = ServerStorage.AyoFramework;
-- local Types = require(ServerStorage.AyoFramework.Types);

local rootClassNameMap = {
   Tool = "Tool";
   Placeable = "Model";
   Interactable = "Model";
}

local usedAyoKeys = {};

local function ValidateUnit(instance:Instance, ayoType:string)
   local ayoKey = instance:GetAttribute("ayoKey");
   local className = rootClassNameMap[ayoType];
   
   assert(instance:IsA(className), `Root instance of '{ayoType}' must be '{className}' - error key: {ayoKey}`);
   assert(typeof(ayoKey) == "string", `Root instance of '{ayoType}' must contain valid [ayoKey] attribute - `)
   assert(usedAyoKeys[ayoKey] == nil, `{ayoType} with ayoKey '{ayoKey}' already exists, different {ayoType}s must have unique ayoKeys`);
   assert(instance:GetAttribute("unitKey") == nil, `Unit template must not contain unitKey`)

   if ayoType == "Tool" then
      local activateModule = instance:FindFirstChild("Activate");
      local handle = instance:FindFirstChild("Handle");
      assert(activateModule and activateModule:IsA("ModuleScript"), "Root instance of 'Tool' must contain an 'Activate' module");
      assert(typeof(require(activateModule)) == "function", "'Activate' module must return a function");
      assert(handle and handle:IsA("BasePart"), "");
   elseif ayoType == "Placeable" then
      
   elseif ayoType == "Interactable" then
      local prompt = instance:FindFirstAncestorOfClass("ProximityPrompt");
      local triggeredModule = instance:FindFirstChild("Triggered");
      assert(prompt, "Root instance of 'Interactable' must contain a ProximityPrompt");
      assert(triggeredModule and triggeredModule:IsA("ModuleScript"), "Root instance of 'Tool' must contain a 'Triggered' module");
      assert(typeof(require(triggeredModule)) == "function", "'Activate' module must return a function");
   end
   usedAyoKeys[ayoKey] = true;
end

local function GetUnits(folder:Folder, ayoType:string)
   local tbl = {};
   for _, instance in folder:GetChildren() do
      ValidateUnit(instance, ayoType);
      tbl[instance:GetAttribute("ayoKey")] = instance;
   end
   return tbl;
end

local items = {
   Tools = GetUnits(AyoFolder.Tools, "Tool") :: {[string]:Tool};
   Placeables = GetUnits(AyoFolder.Placeables, "Placeable") :: {[string]:Model};
   Interactables = GetUnits(AyoFolder.Interactables, "Interactable") :: {[string]:Model};
};

Net.HandleRequest("AvailableItems", function(...): ...any
   return items;
end);


return items;