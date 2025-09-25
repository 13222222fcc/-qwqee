-- 罗布乐思脚本UI by 小风
-- 完全公益，请勿倒卖
-- 快手账号：小车 | 快手号：QQ3867888

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("小风脚本", "DarkTheme")

-- 公告页面
local AnnouncementTab = Window:NewTab("公告")
local AnnouncementSection = AnnouncementTab:NewSection("公告信息")
AnnouncementSection:NewLabel("完全公益，请勿倒卖")
AnnouncementSection:NewLabel("UI作者：小风")
AnnouncementSection:NewLabel("快手账号：小车")
AnnouncementSection:NewLabel("快手号：QQ3867888")
AnnouncementSection:NewLabel("感谢使用!")
AnnouncementSection:NewButton("不可用按钮", "此按钮不可用", function()
    -- 按钮不可用
end)
AnnouncementSection:NewToggle("不可用切换", "此切换不可用", function(state)
    -- 切换不可用
end)
AnnouncementSection:NewSlider("不可用滑块", "此滑块不可用", 100, 0, function(s)
    -- 滑块不可用
end)

-- 通用脚本页面
local GeneralTab = Window:NewTab("通用脚本")
local GeneralSection = GeneralTab:NewSection("通用功能")

-- 飞行功能
local flying = false
local flySpeed = 50
local flyConnection

GeneralSection:NewToggle("飞行", "启用/禁用飞行", function(state)
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
GeneralSection:NewSlider("飞行速度", "调整飞行速度", 500, 1, function(s)
    flySpeed = s
end)

-- 自定义移速
GeneralSection:NewSlider("移动速度", "调整移动速度", 100, 16, function(s)
    local player = game.Players.LocalPlayer
    if player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = s
        end
    end
end)

-- 甩飞所有人
GeneralSection:NewButton("甩飞所有人", "甩飞所有玩家", function()
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

GeneralSection:NewToggle("透视", "启用/禁用透视", function(state)
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

GeneralSection:NewToggle("自瞄", "启用/禁用自瞄", function(state)
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
GeneralSection:NewButton("摧毁服务器?!?", "警告：此操作不可逆!", function()
    -- 改变天空
    local lighting = game:GetService("Lighting")
    local sky = lighting:FindFirstChildOfClass("Sky")
    if not sky then
        sky = Instance.new("Sky")
        sky.Parent = lighting
    end
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
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 0.1, 0)
    text.Position = UDim2.new(0, 0, 0, 0)
    text.Text = "You..."
    text.TextScaled = true
    text.TextColor3 = Color3.new(1, 0, 0)
    text.BackgroundTransparency = 1
    text.Font = Enum.Font.GothamBold
    text.Parent = gui
    
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
local AbandonedTab = Window:NewTab("被遗弃")
local AbandonedSection = AbandonedTab:NewSection("被遗弃功能")

-- 访客1337自动防御
AbandonedSection:NewToggle("访客1337自动防御", "启用/禁用自动防御", function(state)
    -- 自动防御逻辑
    if state then
        -- 这里添加自动防御的具体实现
    end
end)

-- 无限体力
local infiniteStamina = false
local staminaConnection

AbandonedSection:NewToggle("无限体力", "启用/禁用无限体力", function(state)
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

AbandonedSection:NewToggle("自动维修发电机", "每三秒修一次", function(state)
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
AbandonedSection:NewButton("传送到杀手", "传送到杀手位置", function()
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

AbandonedSection:NewToggle("透视玩家", "高亮显示玩家", function(state)
    abandonedESP = state
    if not abandonedESP then
        for _, obj in pairs(abandonedESPObjects) do
            if obj then
                obj:Remove()
            end
        end
        abandonedESPObjects = {}
        return
    end
    
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character then
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            
            -- 显示名字
            local billboard = Instance.new("BillboardGui")
            billboard.Parent = player.Character.Head
            billboard.Size = UDim2.new(0, 100, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true
            
            local text = Instance.new("TextLabel")
            text.Parent = billboard
            text.Size = UDim2.new(1, 0, 1, 0)
            text.Text = player.Name
            text.TextScaled = true
            text.BackgroundTransparency = 1
            
            -- 根据角色类型设置颜色
            if player.Name == "Killer" or player.Team and player.Team.Name:lower():find("killer") then
                highlight.FillColor = Color3.new(1, 0, 0) -- 红色
                text.TextColor3 = Color3.new(1, 0, 0)
            else
                highlight.FillColor = Color3.new(0, 1, 0) -- 绿色
                text.TextColor3 = Color3.new(0, 1, 0)
            end
            
            table.insert(abandonedESPObjects, highlight)
            table.insert(abandonedESPObjects, billboard)
        end
    end
end)

-- 传送到发电机
AbandonedSection:NewButton("传送到发电机", "传送到发电机位置", function()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj.Name:lower():find("generator") or obj.Name:lower():find("gen") then
            local localChar = game.Players.LocalPlayer.Character
            if localChar then
                local localRoot = localChar:FindFirstChild("HumanoidRootPart")
                if localRoot then
                    localRoot.CFrame = obj.CFrame * CFrame.new(0, 3, 0)
                    break
                end
            end
        end
    end
end)

-- 初始化
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if flying and flyConnection then
        flyConnection:Disconnect()
        flying = false
    end
end)

print("小风脚本加载成功！")
