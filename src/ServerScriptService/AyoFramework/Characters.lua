local ServerStorage = game:GetService("ServerStorage")
local Characters = {};
local usedAyoKeys = {};

---@param char Model
local function ValidateChar(char)
    local ayoKey = char:GetAttribute("ayoKey")
    local humanoid = char:FindFirstChildOfClass("Humanoid");
    local behaviourModule = char:FindFirstChild("Behaviours");
    assert(ayoKey and typeof(ayoKey) == "string", "Characters must contain a valid ayoKey");
    assert(usedAyoKeys[ayoKey] == nil, "Character must contain unique ayoKey");
    assert(humanoid, "Characters must contain humanoids");
    assert(behaviourModule and behaviourModule:IsA("ModuleScript"), "Characters must contain a 'Behaviours' module");
    usedAyoKeys[ayoKey] = true;
end

---@param char Model
for _, char in ServerStorage.AyoFramework.Characters:GetChildren() do
    local ayoKey = char:GetAttribute("ayoKey");
    ValidateChar(char);
    Characters[ayoKey] = char;
end

return Characters;