local ServerStorage = game:GetService("ServerStorage");
local AyoFolder = ServerStorage.AyoFramework;
local Tool = require(ServerStorage.AyoFramework.AyoTypes.Tool)
local Types = require(ServerStorage.AyoFramework.Types);

local function GetUnits(folder:Folder, rootClassName:string)
    local tbl = {};
    for index, instance in folder:GetChildren() do
        local ayoKey = instance:GetAttribute("ayoKey");
        assert(typeof(ayoKey)=="string", "Root instance of 'Tool' must contain valid attribute [ayoKey]");
        assert(instance:IsA(rootClassName), `Root instance of '{folder.Name}' must be a '{rootClassName}'`);
        tbl[index] = {
            ayoKey = ayoKey;
            instance = instance;
        };
    end
    return tbl;
end

local items:{
    Tools:          {{ayoKey:string, instance:Tool}};
    Placeables:     {{ayoKey:string, instance:Model}};
    Interactables:  {{ayoKey:string, instance:Model}};
} = {
    Tools = GetUnits(AyoFolder.Tools, "Tool");
    Placeables = GetUnits(AyoFolder.Placeables, "Model");
};



return items;