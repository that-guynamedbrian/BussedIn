local UserInputService = game:GetService("UserInputService")


local Handler = {};
local conn:RBXScriptConnection;
local model:Model;
local transparencies:{[BasePart]:number}

local function ghostify()
    for _, instance in model:GetDescendants() do
        
    end
end

function Handler.EnterPlacementMode(placeable:Model)
    model = placeable;
    conn = UserInputService.InputEnded:Connect(function(input: InputObject, gpe: boolean)
        if gpe then return end

    end)
end

function Handler.ExitPlacementMode()
    if conn then conn:Disconnect() end
end


return Handler;