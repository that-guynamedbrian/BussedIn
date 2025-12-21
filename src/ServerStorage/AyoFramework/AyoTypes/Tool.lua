local ServerStorage = game:GetService("ServerStorage");
local Tool = {};

function Tool.new(ayoKey:string)
	assert(typeof(ayoKey) == "string", "Invalid parameter 'ayoKey', must be of type string");
	local toolInstance:Tool;
	for name, tool in ServerStorage.AyoFramework.Tools:GetChildren() do
		if tool:GetAttribute("ayoKey") == ayoKey then
			toolInstance = tool;
			break;
		end
	end
	assert(toolInstance ~= nil, `No tool with ayoKey '{ayoKey}' was found`)
	assert(typeof(toolInstance) == "Instance" and toolInstance.ClassName == "Tool", "Root toolInstance of a Tool must be a Tool");
	assert(toolInstance:GetAttribute("ayoKey"), "Root toolInstance must contain a valid ayoKey attribute");
	

	return {};
end;

return Tool;
