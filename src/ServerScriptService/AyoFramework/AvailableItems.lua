local ServerStorage = game:GetService("ServerStorage");
local AyoFolder = ServerStorage.AyoFramework;
local Types = require(ServerStorage.AyoFramework.Types);

local rootClassNameMap = {
   Tool = "Tool";
   Placeable = "Model";
   Interactable = "Model";
}

local usedAyoKeys = {};
---comment
---@param instance any
---@param ayoType string
local function ValidateUnit(instance, ayoType)
   local ayoKey = instance:GetAttribute("ayoKey");
   local className = rootClassNameMap[ayoType];
   
   assert(instance:IsA(className), `Root instance of '{ayoType}' must be '{className}' - error key: {ayoKey}`);
   assert(typeof(ayoKey) == "string", `Root instance of '{ayoType}' must contain valid [ayoKey] attribute - `)
   assert(usedAyoKeys[ayoKey] == nil, `{ayoType} with ayoKey '{ayoKey}' already exists, different {ayoType}s must have unique ayoKeys`);
   assert(instance:GetAttribute("unitKey"), `Unit template must not contain`)

   if ayoType == "Tool" then
      local activateModule = instance:FindFirstChild("Activate");
      assert(activateModule and activateModule:IsA("ModuleScript"), "Root instance of 'Tool' must contain an 'Activate' module");
      assert(typeof(require(activateModule)) == "function", "'Activate' module must return a function");
   elseif ayoType == "Placeable" then
   elseif ayoType == "Interactable" then
   end
   usedAyoKeys[ayoKey] = true;
end

local function GetUnits(folder:Folder, ayoType:string)
   local tbl = {};
   for index, instance in folder:GetChildren() do
      ValidateUnit(instance, ayoType);
      tbl[instance:GetAttribute("ayoKey")] = instance;
   end
   return tbl;
end

local items = {
   Tools = GetUnits(AyoFolder.Tools, "Tool");
   Placeables = GetUnits(AyoFolder.Placeables, "Placeable");
   Interactables = GetUnits(AyoFolder.Interactables, "Interactable");
};

return items;