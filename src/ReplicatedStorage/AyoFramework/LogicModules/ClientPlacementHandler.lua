local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local React = require(ReplicatedStorage.Packages.React)
local HotbarItemsContext = require(ReplicatedStorage.UIModules.Contexts.HotbarItemsContext)
local Net = require(ReplicatedStorage.Utils.Net)
local Signal = require(ReplicatedStorage.Utils.Signal)


local Handler = {};
Handler.Placed = Signal.new();

local hotbarItemState:HotbarItemsContext.ContextValue;
local userInputConn:RBXScriptConnection;
local preRenderConn:RBXScriptConnection;

local model:Model;
local transparencies:{[BasePart]:number} = {};

local highlight = Instance.new("Highlight")
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
highlight.FillTransparency = 1
highlight.OutlineTransparency = 0
highlight.Parent = workspace
highlight.Enabled = false

local VALID_COLOR = Color3.new(0.5,1,0.5)
local INVALID_COLOR = Color3.new(1,0.2,0.2)

local canPlace = false

local function ghostify()
    for _, instance in model:GetDescendants() do
        if not instance:IsA("BasePart") then continue end
        transparencies[instance] = instance.Transparency
        instance.Transparency = instance.Transparency - 0.5
    end
end

local function deghostify()
    for instance, transparency in transparencies do
        instance.Transparency = transparency
    end
end

local function onInputEnded(input: InputObject, gpe: boolean)
    if gpe or input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
    local mousePos = UserInputService:GetMouseLocation()
    local ray = workspace.CurrentCamera:ViewportPointToRay(mousePos.X, mousePos.Y)
    local success = canPlace and Net.Request(1, "Place", model, ray.Origin, ray.Direction)
    if success then
        print(`successfully placed {model}`)
        Handler.ExitPlacementMode()
    end
end

local function onPreRender() 
    local mousePos = UserInputService:GetMouseLocation()
    local ray = workspace.CurrentCamera:ViewportPointToRay(mousePos.X, mousePos.Y)
    local params = RaycastParams.new()
    params.FilterType = Enum.RaycastFilterType.Include
    params.RespectCanCollide = true
    for _, instance in workspace:GetChildren() do
        if instance:IsA("Folder") then
            params:AddToFilter(instance) 
        end
    end
    local result = workspace:Raycast(ray.Origin, ray.Direction*100, params)
    if result then
        local size = model:GetExtentsSize();
        local target = CFrame.fromMatrix(result.Position, Vector3.xAxis, result.Normal) * CFrame.new(0,size.Y/2,0);
        model:PivotTo(target);
        highlight.OutlineColor = VALID_COLOR;
        canPlace = true;
    else
        highlight.OutlineColor = INVALID_COLOR;
        canPlace = false;
    end
end

function Handler.EnterPlacementMode(placeable:Model, contextvalue)
    hotbarItemState = contextvalue
    model = placeable
    highlight.Adornee = model
    highlight.Enabled = true
    ghostify()
    preRenderConn = RunService.PreRender:Connect(onPreRender)
    userInputConn = UserInputService.InputEnded:Connect(onInputEnded)
end

function Handler.ExitPlacementMode()
    if preRenderConn then preRenderConn:Disconnect() end
    if userInputConn then userInputConn:Disconnect() end
    model.Parent = workspace
    highlight.Adornee = nil
    highlight.Enabled = false
    deghostify()
    for _, tuple in hotbarItemState do
        if tuple.Item == model then
            tuple.ChangeItem(nil)
        end
    end
    model = nil::any;
end

return Handler;