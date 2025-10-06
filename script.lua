local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/-/Main/UI"))()

if game.Players.LocalPlayer.Name == "AQ14ABS" or game.Players.LocalPlayer.Name == "edc12363" or game.Players.LocalPlayer.Name == "onygfvjop" or game.Players.LocalPlayer.Name == "ah_kdj3" or game.Players.LocalPlayer.Name == "luoyang100616" or game.Players.LocalPlayer.Name == "hdjdje675" or game.Players.LocalPlayer.Name == "qazwsxuruu" or game.Players.LocalPlayer.Name == "ADCZ4xx" or game.Players.LocalPlayer.Name == "TM5418888" or game.Players.LocalPlayer.Name == "codm656558" then
    game.Players.LocalPlayer:Kick("Exploiting😂")
else

OrionLib:MakeNotification({
      Name = "加白名单没😡",
      Content = "Hello",
      Time = 3.5 })

local Sound = Instance.new("Sound")
      Sound.SoundId = "rbxassetid://4590662766"
      Sound.Parent = game:GetService("SoundService")
      Sound.Volume = 5
      Sound:Play()
      Sound.Ended:Wait()
      Sound:Destroy()

local Window = OrionLib:MakeWindow({Name = "脚本中心", HidePremium = false, SaveConfig = false, IntroText = "脚本中心", ConfigFolder = "脚本中心"})

local Tab = Window:MakeTab({
      Name = "公告",
      Icon = "rbxassetid://14250466898",
      PremiumOnly = false
})

Tab:AddParagraph("作者","小车")
Tab:AddLabel("此脚本为缝合")
Tab:AddLabel("此脚本完全免费禁止倒卖")
Tab:AddLabel("QQ群 : 封号了")
Tab:AddLabel("DC群组 : 是不是想偷源码呀😂")

local Tab = Window:MakeTab({
      Name = "通用",
      Icon = "rbxassetid://14250466898",
      PremiumOnly = false
})

Tab:AddButton({
    Name = "IY Dex修复版",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
end})

Tab:AddButton({
    Name = "普京比例",
    Callback = function()
getgenv().Resolution = {
    [".gg/scripters"] = 0.65
}

local Camera = workspace.CurrentCamera
if getgenv().gg_scripters == nil then
    game:GetService("RunService").RenderStepped:Connect(
        function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end
    )
end
getgenv().gg_scripters = "g5s"
end})

Tab:AddButton({
    Name = "恢复比例",
    Callback = function()
getgenv().Resolution = {
    [".gg/scripters"] = 1
}

local Camera = workspace.CurrentCamera
if getgenv().gg_scripters == nil then
    game:GetService("RunService").RenderStepped:Connect(
        function()
            Camera.CFrame = Camera.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, getgenv().Resolution[".gg/scripters"], 0, 0, 0, 1)
        end
    )
end
getgenv().gg_scripters = "g5s"
end})

Tab:AddButton({
    Name = "锁定人物视角",
    Callback = function()
local ShiftlockStarterGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
ShiftlockStarterGui.Name = "Shiftlock (StarterGui)"
ShiftlockStarterGui.Parent = game.CoreGui
ShiftlockStarterGui.ZIndexBehavior =  Enum.ZIndexBehavior.Sibling
ShiftlockStarterGui.ResetOnSpawn = false

ImageButton.Parent = ShiftlockStarterGui
ImageButton.Active = true
ImageButton.Draggable = true
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.BackgroundTransparency = 1.000
ImageButton.Position = UDim2.new(0.921914339, 0, 0.552375436, 0)
ImageButton.Size = UDim2.new(0.0636147112, 0, 0.0661305636, 0)
ImageButton.SizeConstraint = Enum.SizeConstraint.RelativeXX
ImageButton.Image = "http://www.roblox.com/asset/?id=182223762"
local function TLQOYN_fake_script()
    local script = Instance.new("LocalScript", ImageButton)

    local MobileCameraFramework = {}
    local players = game:GetService("Players")
    local runservice = game:GetService("RunService")
    local CAS = game:GetService("ContextActionService")
    local player = players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local root = character:WaitForChild("HumanoidRootPart")
    local humanoid = character.Humanoid
    local camera = workspace.CurrentCamera
    local button = script.Parent
    uis = game:GetService("UserInputService")
    ismobile = uis.TouchEnabled
    button.Visible = ismobile
    
    local states = {
        OFF = "rbxasset://textures/ui/mouseLock_off@2x.png",
        ON = "rbxasset://textures/ui/mouseLock_on@2x.png"
    }
    local MAX_LENGTH = 900000
    local active = false
    local ENABLED_OFFSET = CFrame.new(1.7, 0, 0)
    local DISABLED_OFFSET = CFrame.new(-1.7, 0, 0)
local rootPos = Vector3.new(0,0,0)
local function UpdatePos()
if player.Character and player.Character:FindFirstChildOfClass"Humanoid" and player.Character:FindFirstChildOfClass"Humanoid".RootPart then
rootPos = player.Character:FindFirstChildOfClass"Humanoid".RootPart.Position
end
end
    local function UpdateImage(STATE)
        button.Image = states[STATE]
    end
    local function UpdateAutoRotate(BOOL)
if player.Character and player.Character:FindFirstChildOfClass"Humanoid" then
player.Character:FindFirstChildOfClass"Humanoid".AutoRotate = BOOL
end
end
    local function GetUpdatedCameraCFrame()
if game:GetService"Workspace".CurrentCamera then
return CFrame.new(rootPos, Vector3.new(game:GetService"Workspace".CurrentCamera.CFrame.LookVector.X * MAX_LENGTH, rootPos.Y, game:GetService"Workspace".CurrentCamera.CFrame.LookVector.Z * MAX_LENGTH))
end
end
    local function EnableShiftlock()
UpdatePos()
        UpdateAutoRotate(false)
        UpdateImage("ON")
if player.Character and player.Character:FindFirstChildOfClass"Humanoid" and player.Character:FindFirstChildOfClass"Humanoid".RootPart then
player.Character:FindFirstChildOfClass"Humanoid".RootPart.CFrame = GetUpdatedCameraCFrame()
end
if game:GetService"Workspace".CurrentCamera then
game:GetService"Workspace".CurrentCamera.CFrame = camera.CFrame * ENABLED_OFFSET
end
    end
    local function DisableShiftlock()
UpdatePos()
        UpdateAutoRotate(true)
        UpdateImage("OFF")
        if game:GetService"Workspace".CurrentCamera then
game:GetService"Workspace".CurrentCamera.CFrame = camera.CFrame * DISABLED_OFFSET
end
        pcall(function()
            active:Disconnect()
            active = nil
        end)
    end
    UpdateImage("OFF")
    active = false
    function ShiftLock()
        if not active then
            active = runservice.RenderStepped:Connect(function()
                EnableShiftlock()
            end)
        else
            DisableShiftlock()
        end
    end
    local ShiftLockButton = CAS:BindAction("ShiftLOCK", ShiftLock, false, "On")
    CAS:SetPosition("ShiftLOCK", UDim2.new(0.8, 0, 0.8, 0))
    button.MouseButton1Click:Connect(function()
        if not active then
            active = runservice.RenderStepped:Connect(function()
                EnableShiftlock()
            end)
        else
            DisableShiftlock()
        end
    end)
    return MobileCameraFramework
    
end
coroutine.wrap(TLQOYN_fake_script)()
local function OMQRQRC_fake_script()
    local script = Instance.new("LocalScript", ShiftlockStarterGui)

    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local Settings = UserSettings()
    local GameSettings = Settings.GameSettings
    local ShiftLockController = {}
    while not Players.LocalPlayer do
        wait()
    end
    local LocalPlayer = Players.LocalPlayer
    local Mouse = LocalPlayer:GetMouse()
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
    local ScreenGui, ShiftLockIcon, InputCn
    local IsShiftLockMode = true
    local IsShiftLocked = true
    local IsActionBound = false
    local IsInFirstPerson = false
    ShiftLockController.OnShiftLockToggled = Instance.new("BindableEvent")
    local function isShiftLockMode()
        return LocalPlayer.DevEnableMouseLock and GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch and LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.ClickToMove and GameSettings.ComputerMovementMode ~= Enum.ComputerMovementMode.ClickToMove and LocalPlayer.DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable
    end
    if not UserInputService.TouchEnabled then
        IsShiftLockMode = isShiftLockMode()
    end
    local function onShiftLockToggled()
        IsShiftLocked = not IsShiftLocked
        ShiftLockController.OnShiftLockToggled:Fire()
    end
    local initialize = function()
        print("enabled")
    end
    function ShiftLockController:IsShiftLocked()
        return IsShiftLockMode and IsShiftLocked
    end
    function ShiftLockController:SetIsInFirstPerson(isInFirstPerson)
        IsInFirstPerson = isInFirstPerson
    end
    local function mouseLockSwitchFunc(actionName, inputState, inputObject)
        if IsShiftLockMode then
            onShiftLockToggled()
        end
    end
    local function disableShiftLock()
        if ScreenGui then
            ScreenGui.Parent = nil
        end
        IsShiftLockMode = false
        Mouse.Icon = ""
        if InputCn then
            InputCn:disconnect()
            InputCn = nil
        end
        IsActionBound = false
        ShiftLockController.OnShiftLockToggled:Fire()
    end
    local onShiftInputBegan = function(inputObject, isProcessed)
        if isProcessed then
            return
        end
        if inputObject.UserInputType ~= Enum.UserInputType.Keyboard or inputObject.KeyCode == Enum.KeyCode.LeftShift or inputObject.KeyCode == Enum.KeyCode.RightShift then
        end
    end
    local function enableShiftLock()
        IsShiftLockMode = isShiftLockMode()
        if IsShiftLockMode then
            if ScreenGui then
                ScreenGui.Parent = PlayerGui
            end
            if IsShiftLocked then
                ShiftLockController.OnShiftLockToggled:Fire()
            end
            if not IsActionBound then
                InputCn = UserInputService.InputBegan:connect(onShiftInputBegan)
                IsActionBound = true
            end
        end
    end
    GameSettings.Changed:connect(function(property)
        if property == "ControlMode" then
            if GameSettings.ControlMode == Enum.ControlMode.MouseLockSwitch then
                enableShiftLock()
            else
                disableShiftLock()
            end
        elseif property == "ComputerMovementMode" then
            if GameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove then
                disableShiftLock()
            else
                enableShiftLock()
            end
        end
    end)
    LocalPlayer.Changed:connect(function(property)
        if property == "DevEnableMouseLock" then
            if LocalPlayer.DevEnableMouseLock then
                enableShiftLock()
            else
                disableShiftLock()
            end
        elseif property == "DevComputerMovementMode" then
            if LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.ClickToMove or LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable then
                disableShiftLock()
            else
                enableShiftLock()
            end
        end
    end)
    LocalPlayer.CharacterAdded:connect(function(character)
        if not UserInputService.TouchEnabled then
            initialize()
        end
    end)
    if not UserInputService.TouchEnabled then
        initialize()
        if isShiftLockMode() then
            InputCn = UserInputService.InputBegan:connect(onShiftInputBegan)
            IsActionBound = true
        end
    end
    enableShiftLock()
    return ShiftLockController
    
end
coroutine.wrap(OMQRQRC_fake_script)()
end})

Tab:AddButton({
    Name = "IY指令",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end})

Tab:AddButton({
    Name = "IY指令 ( 中文版 )",
    Callback = function()
loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,87,97,110,103,122,104,101,104,97,111,104,47,102,108,121,45,97,119,97,121,47,109,97,105,110,47,37,69,54,37,56,67,37,56,55,37,69,52,37,66,66,37,56,65,37,69,52,37,66,56,37,65,68,37,69,54,37,57,54,37,56,55,46,116,120,116})end)())))()
end})

Tab:AddButton({
    Name = "撸R6",
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
end})

Tab:AddButton({
    Name = "撸R15",
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
end})

Tab:AddButton({
    Name = "自瞄 ( 脑壳 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "Head",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "自瞄 ( 身上 )",
    Callback = function()
getgenv().Camlock_Settings = {
    Prediction = 0,
    AimPart = "HumanoidRootPart",
    AutoPrediction = false,
    Notification = true,
    Button = true,
    AntiGroundShots = false,
    UnderGroundResolver = false,
    Version = "2.5.1",
    Credits = "space_0999",
    DiscordServer = "discord.gg/SKhamGzTdn"
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/elxocasXD/Trip-Hub/main/Scripts/Cam%20Lock.lua"))()
end})

Tab:AddButton({
    Name = "自瞄锁头老版本",
    Callback = function()
local fov = 50
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 0, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = Cam.ViewportSize / 2

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            local part = player.Character and player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)
end})

Tab:AddButton({
    Name = "自瞄锁头老版本 ( 大范围 )",
    Callback = function()
local fov = 100
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 0, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = Cam.ViewportSize / 2

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            local part = player.Character and player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)
end})

Tab:AddButton({
    Name = "自瞄锁头 ( 斩念 )",
    Callback = function()
local fov = 100
local smoothness = 10
local crosshairDistance = 5

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Cam = game.Workspace.CurrentCamera

local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 255, 0)
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FovAdjustGui"
ScreenGui.Parent = PlayerGui

local Frame = Instance.new("Frame")
Frame.Name = "MainFrame"
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderColor3 = Color3.fromRGB(128, 0, 128)
Frame.BorderSizePixel = 2
Frame.Position = UDim2.new(0.3, 0, 0.3, 0)
Frame.Size = UDim2.new(0.4, 0, 0.4, 0)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0)
MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
MinimizeButton.Parent = Frame

local isMinimized = false

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        MinimizeButton.Text = "+"
    else
        Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        MinimizeButton.Text = "-"
    end
end)

local FovLabel = Instance.new("TextLabel")
FovLabel.Name = "FovLabel"
FovLabel.Text = "自瞄范围"
FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FovLabel.BackgroundTransparency = 1
FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0)
FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
FovLabel.Parent = Frame

local FovSlider = Instance.new("TextBox")
FovSlider.Name = "FovSlider"
FovSlider.Text = tostring(fov)
FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0)
FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
FovSlider.Parent = Frame

local SmoothnessLabel = Instance.new("TextLabel")
SmoothnessLabel.Name = "SmoothnessLabel"
SmoothnessLabel.Text = "自瞄平滑度"
SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothnessLabel.BackgroundTransparency = 1
SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0)
SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
SmoothnessLabel.Parent = Frame

local SmoothnessSlider = Instance.new("TextBox")
SmoothnessSlider.Name = "SmoothnessSlider"
SmoothnessSlider.Text = tostring(smoothness)
SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0)
SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
SmoothnessSlider.Parent = Frame

local CrosshairDistanceLabel = Instance.new("TextLabel")
CrosshairDistanceLabel.Name = "CrosshairDistanceLabel"
CrosshairDistanceLabel.Text = "自瞄预判距离"
CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CrosshairDistanceLabel.BackgroundTransparency = 1
CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0)
CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0)
CrosshairDistanceLabel.Parent = Frame

local CrosshairDistanceSlider = Instance.new("TextBox")
CrosshairDistanceSlider.Name = "CrosshairDistanceSlider"
CrosshairDistanceSlider.Text = tostring(crosshairDistance)
CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0)
CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0)
CrosshairDistanceSlider.Parent = Frame

local targetCFrame = Cam.CFrame

local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
    FOVring.Radius = fov
end

local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end

UserInputService.InputBegan:Connect(onKeyDown)

local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = Cam.ViewportSize / 2

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            local part = player.Character and player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude

                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = player
                end
            end
        end
    end

    return nearest
end

RunService.RenderStepped:Connect(function()
    updateDrawings()

    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        local targetCharacter = closest.Character
        local targetHead = targetCharacter.Head
        local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")

        local isMoving = targetRootPart.Velocity.Magnitude > 0.1

        local targetPosition
        if isMoving then
            targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance)
        else
            targetPosition = targetHead.Position
        end

        targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition)
    else
        targetCFrame = Cam.CFrame
    end
    Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness)
end)

FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newFov = tonumber(FovSlider.Text)
        if newFov then
            fov = newFov
        else
            FovSlider.Text = tostring(fov)
        end
    end
end)

SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newSmoothness = tonumber(SmoothnessSlider.Text)
        if newSmoothness then
            smoothness = newSmoothness
        else
            SmoothnessSlider.Text = tostring(smoothness)
        end
    end
end)

CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss)
    if enterPressed then
        local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text)
        if newCrosshairDistance then
            crosshairDistance = newCrosshairDistance
        else
            CrosshairDistanceSlider.Text = tostring(crosshairDistance)
        end
    end
end)
end})

Tab:AddButton({
    Name = "修改玩家碰撞体积箱",
    Callback = function()
local Close = Instance.new("TextButton")
local Open2 = Instance.new("ScreenGui")
local Open = Instance.new("TextButton")
local FightingGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local Cre = Instance.new("TextLabel")
local HitBox = Instance.new("TextBox")
local Red = Instance.new("TextBox")
local Green = Instance.new("TextBox")
local Blue = Instance.new("TextBox")
local TextLabel = Instance.new("TextLabel")

FightingGui.Name = "FightingGui"
FightingGui.Parent = game.CoreGui
FightingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling


Open2.Name = "Tools"
Open2.Parent = game.CoreGui
Open2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Open.Name = "开/关"
Open.Parent = Open2
Open.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Open.Position = UDim2.new(0, 0, 0.451871663, 0)
Open.Size = UDim2.new(0, 78, 0, 50)
Open.Font = Enum.Font.SourceSans
Open.Text = "开/关"
Open.TextColor3 = Color3.fromRGB(250, 0, 0)
Open.TextScaled = true
Open.TextSize = 14.000
Open.TextWrapped = true
Open.MouseButton1Down:Connect(function()
 FightingGui.Enabled = true
end)

Close.Name = "Close"
Close.Parent = main
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Close.Position = UDim2.new(1, 0, -0.226244345, 0)
Close.Size = UDim2.new(0, 60, 0, 50)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextWrapped = true
Close.MouseButton1Down:Connect(function()
 FightingGui.Enabled = false
end)

main.Parent = FightingGui
main.Active = true
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.Position = UDim2.new(0.073011741, 0, 0.237333342, 0)
main.Size = UDim2.new(0, 273, 0, 221)
main.Draggable = true

Cre.Name = "Cre"
Cre.Parent = main
Cre.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Cre.Position = UDim2.new(0, 0, -0.226244345, 0)
Cre.Size = UDim2.new(0, 273, 0, 50)
Cre.Font = Enum.Font.SourceSans
Cre.Text = "修改人物碰撞体积箱"
Cre.TextColor3 = Color3.fromRGB(0, 0, 0)
Cre.TextScaled = true
Cre.TextSize = 14.000
Cre.TextWrapped = true

HitBox.Name = "输入"
HitBox.Parent = main
HitBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
HitBox.Position = UDim2.new(0.0586080588, 0, 0.0995475128, 0)
HitBox.Size = UDim2.new(0, 65, 0, 50)
HitBox.Font = Enum.Font.SourceSans
HitBox.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
HitBox.PlaceholderText = "输入"
HitBox.Text = ""
HitBox.TextColor3 = Color3.fromRGB(0, 0, 0)
HitBox.TextScaled = true
HitBox.TextSize = 14.000
HitBox.TextWrapped = true

Red.Name = "红色"
Red.Parent = main
Red.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Red.Position = UDim2.new(0.485832304, 0, 0.0995475128, 0)
Red.Size = UDim2.new(0, 37, 0, 31)
Red.Font = Enum.Font.SourceSans
Red.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Red.PlaceholderText = "红色"
Red.Text = ""
Red.TextColor3 = Color3.fromRGB(0, 0, 0)
Red.TextSize = 14.000

Green.Name = "绿色"
Green.Parent = main
Green.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
Green.Position = UDim2.new(0.665319502, 0, 0.0995475128, 0)
Green.Size = UDim2.new(0, 37, 0, 31)
Green.Font = Enum.Font.SourceSans
Green.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Green.PlaceholderText = "绿色"
Green.Text = ""
Green.TextColor3 = Color3.fromRGB(0, 0, 0)
Green.TextSize = 14.000

TextLabel.Parent = main
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
TextLabel.Position = UDim2.new(0.47118023, 0, 0.325791866, 0)
TextLabel.Size = UDim2.new(0, 140, 0, 37)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "颜色"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Blue.Name = "蓝色"
Blue.Parent = main
Blue.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
Blue.Position = UDim2.new(0.837480664, 0, 0.0995475128, 0)
Blue.Size = UDim2.new(0, 37, 0, 31)
Blue.Font = Enum.Font.SourceSans
Blue.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Blue.PlaceholderText = "蓝色"
Blue.Text = ""
Blue.TextColor3 = Color3.fromRGB(0, 0, 0)
Blue.TextSize = 14.000
game:GetService("RunService").RenderStepped:connect(function()
 for i,v in next, game:GetService("Players"):GetPlayers() do
  if v.Name ~= game:GetService("Players").LocalPlayer.Name then
   v.Character.HumanoidRootPart.Size = Vector3.new(HitBox.Text,HitBox.Text,HitBox.Text)
   v.Character.HumanoidRootPart.Transparency = 0.8
   v.Character.HumanoidRootPart.Color = Color3.new(Red.Text,Green.Text,Blue.Text)
   v.Character.HumanoidRootPart.Material = "Neon"
   v.Character.HumanoidRootPart.CanCollide = false
  end
 end
end)
end})

Tab:AddButton({
    Name = "防甩飞",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChinaQY/Scripts/Main/AntiFling.lua"))()
end})

Tab:AddButton({
    Name = "国服马可",
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/r97d7dS0"))()
end})

Tab:AddToggle({
    Name = "夜视",
    Default = false,
    Callback = function(Value)
    if Value then
        game.Lighting.Ambient = Color3.new(1, 1, 1)
    else
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end})

Tab:AddButton({
    Name = "夜视",
    Callback = function()
local Light = game:GetService("Lighting")

function dofullbright()
Light.Ambient 
