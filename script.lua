-- 小风脚本UI源码
-- 完全公益，请勿倒卖
-- UI作者：小风 | 快手账号：小车 | 快手号：QQ3867888

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TopBar = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")
local TabButtons = Instance.new("Frame")
local AnnouncementTabBtn = Instance.new("TextButton")
local GeneralTabBtn = Instance.new("TextButton")
local AbandonedTabBtn = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local AnnouncementPage = Instance.new("Frame")
local GeneralPage = Instance.new("Frame")
local AbandonedPage = Instance.new("Frame")

-- UI设置
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "XiaoFengScript"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 30)

Title.Name = "Title"
Title.Parent = TopBar
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.0
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "小风脚本 - 完全公益"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = TopBar
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ToggleButton.BorderSizePixel = 0
ToggleButton.Position = UDim2.new(0.85, 0, 0, 0)
ToggleButton.Size = UDim2.new(0.15, 0, 1, 0)
ToggleButton.Font = Enum.Font.Gotham
ToggleButton.Text = "隐藏"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.TextSize = 14

TabButtons.Name = "TabButtons"
TabButtons.Parent = MainFrame
TabButtons.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TabButtons.BorderSizePixel = 0
TabButtons.Position = UDim2.new(0, 0, 0, 30)
TabButtons.Size = UDim2.new(1, 0, 0, 40)

AnnouncementTabBtn.Name = "AnnouncementTabBtn"
AnnouncementTabBtn.Parent = TabButtons
AnnouncementTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
AnnouncementTabBtn.BorderSizePixel = 0
AnnouncementTabBtn.Position = UDim2.new(0, 0, 0, 0)
AnnouncementTabBtn.Size = UDim2.new(0.33, 0, 1, 0)
AnnouncementTabBtn.Font = Enum.Font.Gotham
AnnouncementTabBtn.Text = "公告"
AnnouncementTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AnnouncementTabBtn.TextSize = 14

GeneralTabBtn.Name = "GeneralTabBtn"
GeneralTabBtn.Parent = TabButtons
GeneralTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GeneralTabBtn.BorderSizePixel = 0
GeneralTabBtn.Position = UDim2.new(0.33, 0, 0, 0)
GeneralTabBtn.Size = UDim2.new(0.34, 0, 1, 0)
GeneralTabBtn.Font = Enum.Font.Gotham
GeneralTabBtn.Text = "通用脚本"
GeneralTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
GeneralTabBtn.TextSize = 14

AbandonedTabBtn.Name = "AbandonedTabBtn"
AbandonedTabBtn.Parent = TabButtons
AbandonedTabBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AbandonedTabBtn.BorderSizePixel = 0
AbandonedTabBtn.Position = UDim2.new(0.67, 0, 0, 0)
AbandonedTabBtn.Size = UDim2.new(0.33, 0, 1, 0)
AbandonedTabBtn.Font = Enum.Font.Gotham
AbandonedTabBtn.Text = "被遗弃"
AbandonedTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AbandonedTabBtn.TextSize = 14

ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 0, 0, 70)
ContentFrame.Size = UDim2.new(1, 0, 1, -70)

-- 公告页面
AnnouncementPage.Name = "AnnouncementPage"
AnnouncementPage.Parent = ContentFrame
AnnouncementPage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AnnouncementPage.BorderSizePixel = 0
AnnouncementPage.Size = UDim2.new(1, 0, 1, 0)
AnnouncementPage.Visible = true

local AnnouncementText = Instance.new("TextLabel")
AnnouncementText.Parent = AnnouncementPage
AnnouncementText.BackgroundTransparency = 1
AnnouncementText.Position = UDim2.new(0.1, 0, 0.1, 0)
AnnouncementText.Size = UDim2.new(0.8, 0, 0.6, 0)
AnnouncementText.Font = Enum.Font.Gotham
AnnouncementText.Text = "完全公益，请勿倒卖\nUI作者：小风\n快手账号：小车\n快手号：QQ3867888\n感谢使用!"
AnnouncementText.TextColor3 = Color3.fromRGB(255, 255, 255)
AnnouncementText.TextSize = 16
AnnouncementText.TextWrapped = true
AnnouncementText.TextYAlignment = Enum.TextYAlignment.Top

local DisabledButton = Instance.new("TextButton")
DisabledButton.Parent = AnnouncementPage
DisabledButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DisabledButton.BorderSizePixel = 0
DisabledButton.Position = UDim2.new(0.3, 0, 0.7, 0)
DisabledButton.Size = UDim2.new(0.4, 0, 0.1, 0)
DisabledButton.Font = Enum.Font.Gotham
DisabledButton.Text = "不可用按钮"
DisabledButton.TextColor3 = Color3.fromRGB(150, 150, 150)
DisabledButton.TextSize = 14

-- 通用脚本页面
GeneralPage.Name = "GeneralPage"
GeneralPage.Parent = ContentFrame
GeneralPage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GeneralPage.BorderSizePixel = 0
GeneralPage.Size = UDim2.new(1, 0, 1, 0)
GeneralPage.Visible = false

local function createButton(parent, text, position, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.BorderSizePixel = 0
    button.Position = position
    button.Size = UDim2.new(0.4, 0, 0, 30)
    button.Font = Enum.Font.Gotham
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    
    if callback then
        button.MouseButton1Click:Connect(callback)
    end
    
    return button
end

local function createSlider(parent, text, position, min, max, callback)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BorderSizePixel = 0
    frame.Position = position
    frame.Size = UDim2.new(0.4, 0, 0, 50)
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Size = UDim2.new(1, 0, 0.4, 0)
    label.Font = Enum.Font.Gotham
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 12
    
    local slider = Instance.new("Frame")
    slider.Parent = frame
    slider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    slider.BorderSizePixel = 0
    slider.Position = UDim2.new(0, 0, 0.4, 0)
    slider.Size = UDim2.new(1, 0, 0.3, 0)
    
    local fill = Instance.new("Frame")
    fill.Parent = slider
    fill.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    fill.BorderSizePixel = 0
    fill.Size = UDim2.new(0.5, 0, 1, 0)
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.Parent = frame
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(0, 0, 0.7, 0)
    valueLabel.Size = UDim2.new(1, 0, 0.3, 0)
    valueLabel.Font = Enum.Font.Gotham
    valueLabel.Text = "50"
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.TextSize = 12
    
    return {frame = frame, fill = fill, value = valueLabel}
end

local function createToggle(parent, text, position, callback)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    frame.BorderSizePixel = 0
    frame.Position = position
    frame.Size = UDim2.new(0.4, 0, 0, 30)
    
    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.BackgroundTransparency = 1
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.Font = Enum.Font.Gotham
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggle = Instance.new("Frame")
    toggle.Parent = frame
    toggle.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    toggle.BorderSizePixel = 0
    toggle.Position = UDim2.new(0.8, 0, 0.2, 0)
    toggle.Size = UDim2.new(0.2, 0, 0.6, 0)
    
    local toggleFill = Instance.new("Frame")
    toggleFill.Parent = toggle
    toggleFill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    toggleFill.BorderSizePixel = 0
    toggleFill.Position = UDim2.new(0.1, 0, 0.1, 0)
    toggleFill.Size = UDim2.new(0.4, 0, 0.8, 0)
    
    local state = false
    
    frame.MouseButton1Click:Connect(function()
        state = not state
        if state then
            toggleFill.BackgroundColor3 = Color3.fromRGB(50, 255, 50)
            toggleFill.Position = UDim2.new(0.5, 0, 0.1, 0)
        else
            toggleFill.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            toggleFill.Position = UDim2.new(0.1, 0, 0.1, 0)
        end
        
        if callback then
            callback(state)
        end
    end)
    
    return {frame = frame, state = state}
end

-- 飞行功能
local flying = false
local flySpeed = 50
local flyConnection

local flyToggle = createToggle(GeneralPage, "飞行", UDim2.new(0.05, 0, 0.05, 0), function(state)
    flying = state
    if flying then
        local player = game.Players.LocalPlayer
        if player.Character then
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                humanoidRootPart.Gravity = 0
                
                -- 飞行控制
                if flyConnection then flyConnection:Disconnect() end
                flyConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if flying and humanoidRootPart then
                        local cam = workspace.CurrentCamera
                        local moveDir = Vector3.new()
                        
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then
                            moveDir = moveDir + (cam.CFrame.LookVector * flySpeed)
                        end
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then
                            moveDir = moveDir - (cam.CFrame.LookVector * flySpeed)
                        end
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then
                            moveDir = moveDir - (cam.CFrame.RightVector * flySpeed)
                        end
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then
                            moveDir = moveDir + (cam.CFrame.RightVector * flySpeed)
                        end
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
                            moveDir = moveDir + (Vector3.new(0, 1, 0) * flySpeed)
                        end
                        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftShift) then
                            moveDir = moveDir - (Vector3.new(0, 1, 0) * flySpeed)
                        end
                        
                        humanoidRootPart.Velocity = moveDir
                    end
                end)
            end
        end
    else
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        local player = game.Players.LocalPlayer
        if player.Character then
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.Gravity = 1
                humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end
end)

-- 飞行速度调整
local flySpeedSlider = createSlider(GeneralPage, "飞行速度", UDim2.new(0.05, 0, 0.15, 0), 1, 500, function(value)
    flySpeed = value
    flySpeedSlider.value.Text = tostring(value)
end)

-- 自定义移速
local walkSpeed = 16
local walkSpeedSlider = createSlider(GeneralPage, "移动速度", UDim2.new(0.05, 0, 0.3, 0), 16, 100, function(value)
    walkSpeed = value
    walkSpeedSlider.value.Text = tostring(value)
    
    local player = game.Players.LocalPlayer
    if player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = walkSpeed
        end
    end
end)

-- 甩飞所有人
createButton(GeneralPage, "甩飞所有人", UDim2.new(0.05, 0, 0.45, 0), function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character then
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.Velocity = Vector3.new(
                    math.random(-100, 100),
                    math.random(100, 200),
                    math.random(-100, 100)
                )
            end
        end
    end
end)

-- 透视
local espEnabled = false
local espObjects = {}

createToggle(GeneralPage, "透视", UDim2.new(0.55, 0, 0.05, 0), function(state)
    espEnabled = state
    if espEnabled then
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = player.Character
                highlight.FillColor = Color3.fromRGB(0, 255, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                
                table.insert(espObjects, highlight)
            end
        end
    else
        for _, obj in pairs(espObjects) do
            if obj then
                obj:Remove()
            end
        end
        espObjects = {}
    end
end)

-- 自瞄
local aimbotEnabled = false
local aimbotConnection

createToggle(GeneralPage, "自瞄", UDim2.new(0.55, 0, 0.15, 0), function(state)
    aimbotEnabled = state
    if aimbotEnabled then
        aimbotConnection = game:GetService("RunService").RenderStepped:Connect(function()
            local closestPlayer = nil
            local closestDistance = math.huge
            local localPlayer = game.Players.LocalPlayer
            local localChar = localPlayer.Character
            local localRoot = localChar and localChar:FindFirstChild("HumanoidRootPart")
            
            if not localRoot then return end
            
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player ~= localPlayer and player.Character then
                    local targetRoot = player.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        local distance = (targetRoot.Position - localRoot.Position).Magnitude
                        if distance < closestDistance then
                            closestDistance = distance
                            closestPlayer = player
                        end
                    end
                end
            end
            
            if closestPlayer and closestPlayer.Character then
                local targetRoot = closestPlayer.Character:FindFirstChild("HumanoidRootPart")
                if targetRoot then
                    workspace.CurrentCamera.CFrame = CFrame.new(
                        workspace.CurrentCamera.CFrame.Position,
                        targetRoot.Position
                    )
                end
            end
        end)
    elseif aimbotConnection then
        aimbotConnection:Disconnect()
        aimbotConnection = nil
    end
end)

-- 摧毁服务器
createButton(GeneralPage, "摧毁服务器?!?", UDim2.new(0.55, 0, 0.45, 0), function()
    -- 改变天空
    local lighting = game:GetService("Lighting")
    local sky = lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky")
    sky.Parent = lighting
    sky.SkyboxBk = "rbxassetid://1" -- 替换为第一张图片ID
    sky.SkyboxDn = "rbxassetid://1"
    sky.SkyboxFt = "rbxassetid://1"
    sky.SkyboxLf = "rbxassetid://1"
    sky.SkyboxRt = "rbxassetid://1"
    sky.SkyboxUp = "rbxassetid://1"
    
    -- 人物身上冒火
    local player = game.Players.LocalPlayer
    if player.Character then
        local fire = Instance.new("Fire")
        fire.Size = 10
        fire.Heat = 10
        fire.Parent = player.Character.Head
        
        local fire2 = Instance.new("Fire")
        fire2.Size = 15
        fire2.Heat = 15
        fire2.Parent = player.Character.HumanoidRootPart
    end
    
    -- 屏幕上方显示文字
    local gui = Instance.new("ScreenGui")
    local text = Instance.new("TextLabel")
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    text.Parent = gui
    text.Size = UDim2.new(1, 0, 0.1, 0)
    text.Position = UDim2.new(0, 0, 0, 0)
    text.Text = "You..."
    text.TextScaled = true
    text.TextColor3 = Color3.new(1, 0, 0)
    text.BackgroundTransparency = 1
    text.Font = Enum.Font.GothamBold
    
    -- 所有贴图变成第二张图片
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Part") and obj:FindFirstChildWhichIsA("Decal") then
            for _, decal in ipairs(obj:GetChildren()) do
                if decal:IsA("Decal") then
                    decal.Texture = "rbxassetid://2" -- 替换为第二张图片ID
                end
            end
        elseif obj:IsA("Texture") then
            obj.Texture = "rbxassetid://2" -- 替换为第二张图片ID
        end
    end
end)

-- 被遗弃页面
AbandonedPage.Name = "AbandonedPage"
AbandonedPage.Parent = ContentFrame
AbandonedPage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AbandonedPage.BorderSizePixel = 0
AbandonedPage.Size = UDim2.new(1, 0, 1, 0)
AbandonedPage.Visible = false

-- 访客1337自动防御
createToggle(AbandonedPage, "访客1337自动防御", UDim2.new(0.05, 0, 0.05, 0), function(state)
    -- 自动防御逻辑
    if state then
        -- 这里添加自动防御的具体实现
    end
end)

-- 无限体力
local infiniteStamina = false
local staminaConnection

createToggle(AbandonedPage, "无限体力", UDim2.new(0.05, 0, 0.15, 0), function(state)
    infiniteStamina = state
    if infiniteStamina then
        staminaConnection = game:GetService("RunService").Heartbeat:Connect(function()
            local player = game.Players.LocalPlayer
            if player.Character then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    -- 重置体力消耗
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
                    humanoid:ChangeState(Enum.HumanoidStateType.Running)
                end
            end
        end)
    elseif staminaConnection then
        staminaConnection:Disconnect()
        staminaConnection = nil
    end
end)

-- 自动维修发电机
local autoRepair = false
local repairConnection

createToggle(AbandonedPage, "自动维修发电机", UDim2.new(0.05, 0, 0.25, 0), function(state)
    autoRepair = state
    if autoRepair then
        repairConnection = game:GetService("RunService").Heartbeat:Connect(function()
            -- 查找发电机
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj.Name:lower():find("generator") or obj.Name:lower():find("gen") then
                    -- 尝试维修发电机
                    local args = {
                        [1] = obj,
                        [2] = "Repair"
                    }
                    
                    -- 尝试调用远程事件
                    local events = game:GetService("ReplicatedStorage"):GetChildren()
                    for _, event in ipairs(events) do
                        if event:IsA("RemoteEvent") then
                            event:FireServer(unpack(args))
                            break
                        end
                    end
                    
                    -- 每三秒修一次
                    wait(3)
                end
            end
        end)
    elseif repairConnection then
        repairConnection:Disconnect()
        repairConnection = nil
    end
end)

-- 传送到杀手那边
createButton(AbandonedPage, "传送到杀手", UDim2.new(0.05, 0, 0.4, 0), function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local killerRoot = player.Character:FindFirstChild("HumanoidRootPart")
            if killerRoot then
                local localChar = game.Players.LocalPlayer.Character
                if localChar then
                    local localRoot = localChar:FindFirstChild("HumanoidRootPart")
                    if localRoot then
                        localRoot.CFrame = killerRoot.CFrame * CFrame.new(0, 0, 5)
                    end
                end
            end
        end
    end
end)

-- 透视所有幸存者+杀手
local abandonedESP = false
local abandonedESPObjects = {}

createToggle(AbandonedPage, "透视所有玩家", UDim2.new(0.55, 0, 0.05, 0), function(state)
    abandonedESP = state
    if not abandonedESP then
        for _, obj in pairs(abandonedESPObjects) do
            if obj then
                obj:Remove
