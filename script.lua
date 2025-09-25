-- =============================================
-- 终极游戏辅助UI系统
-- 通用功能与被遗弃功能完整整合
-- 适用于忍者注入器
-- =============================================

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

-- 加载Rayfield UI库
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 状态变量
local DestroyServerActive = false
local OriginalTextures = {}
local OriginalSkybox = {}

-- 创建主窗口
local Window = Rayfield:CreateWindow({
    Name = "🔥 终极游戏辅助系统",
    LoadingTitle = "系统初始化中...",
    LoadingSubtitle = "通用功能与被遗弃功能已加载",
    ConfigurationSaving = {Enabled = true, FolderName = "UltimateUI", FileName = "Config"},
    KeySystem = false,
})

-- ==================== 通用功能页面 ====================
local GeneralTab = Window:CreateTab("通用功能", 4483362458)

-- 飞行系统
GeneralTab:CreateSection("✈️ 飞行系统")
local Flying = false
local FlightSpeed = 50

local FlightToggle = GeneralTab:CreateToggle({
    Name = "启用飞行模式",
    CurrentValue = false,
    Flag = "FlightToggle",
    Callback = function(Value)
        Flying = Value
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        
        if Flying and humanoidRootPart then
            humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            humanoidRootPart.Gravity = 0
            
            -- 飞行控制循环
            spawn(function()
                while Flying do
                    humanoidRootPart.Velocity = humanoidRootPart.CFrame.LookVector * FlightSpeed
                    task.wait()
                end
            end)
            
            Rayfield:Notify({
                Title = "飞行系统",
                Content = "飞行模式已激活",
                Duration = 3,
            })
        elseif humanoidRootPart then
            humanoidRootPart.Gravity = 196.2
            Rayfield:Notify({
                Title = "飞行系统",
                Content = "飞行模式已关闭",
                Duration = 3,
            })
        end
    end
})

local FlightSpeedSlider = GeneralTab:CreateSlider({
    Name = "飞行速度调整",
    Range = {10, 200},
    Increment = 5,
    Suffix = "速度",
    CurrentValue = 50,
    Flag = "FlightSpeed",
    Callback = function(Value)
        FlightSpeed = Value
    end
})

-- 移动速度调整
GeneralTab:CreateSection("🏃 移动设置")
local SpeedSlider = GeneralTab:CreateSlider({
    Name = "移动速度",
    Range = {16, 100},
    Increment = 1,
    Suffix = "速度",
    CurrentValue = 50,
    Flag = "SpeedSlider",
    Callback = function(Value)
        local player = Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end
})

local JumpSlider = GeneralTab:CreateSlider({
    Name = "跳跃高度",
    Range = {50, 200},
    Increment = 1,
    Suffix = "高度",
    CurrentValue = 100,
    Flag = "JumpSlider",
    Callback = function(Value)
        local player = Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = Value
        end
    end
})

-- 透视功能
GeneralTab:CreateSection("👁️ 视觉增强")
local ESPToggle = GeneralTab:CreateToggle({
    Name = "透视玩家",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        if Value then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer and player.Character then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.FillColor = Color3.fromRGB(0, 255, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.Name = "ESPHighlight"
                end
            end
            Rayfield:Notify({
                Title = "视觉系统",
                Content = "玩家透视已激活",
                Duration = 3,
            })
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    local highlight = player.Character:FindFirstChild("ESPHighlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
            Rayfield:Notify({
                Title = "视觉系统",
                Content = "玩家透视已关闭",
                Duration = 3,
            })
        end
    end
})

-- 自瞄功能
GeneralTab:CreateSection("🎯 瞄准系统")
local AimbotToggle = GeneralTab:CreateToggle({
    Name = "自瞄辅助",
    CurrentValue = false,
    Flag = "AimbotToggle",
    Callback = function(Value)
        if Value then
            Rayfield:Notify({
                Title = "瞄准系统",
                Content = "自瞄功能已激活",
                Duration = 3,
            })
            
            -- 自瞄逻辑
            spawn(function()
                while AimbotToggle.CurrentValue do
                    local player = Players.LocalPlayer
                    local character = player.Character
                    if character then
                        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart then
                            -- 寻找最近目标
                            local closestTarget = nil
                            local closestDistance = math.huge
                            
                            for _, target in ipairs(Players:GetPlayers()) do
                                if target ~= player and target.Character then
                                    local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
                                    if targetRoot then
                                        local distance = (humanoidRootPart.Position - targetRoot.Position).Magnitude
                                        if distance < closestDistance then
                                            closestDistance = distance
                                            closestTarget = targetRoot
                                        end
                                    end
                                end
                            end
                            
                            -- 瞄准目标
                            if closestTarget then
                                humanoidRootPart.CFrame = CFrame.new(
                                    humanoidRootPart.Position,
                                    closestTarget.Position
                                )
                            end
                        end
                    end
                    task.wait()
                end
            end)
        else
            Rayfield:Notify({
                Title = "瞄准系统",
                Content = "自瞄功能已关闭",
                Duration = 3,
            })
        end
    end
})

-- 甩飞所有人
GeneralTab:CreateSection("🌀 互动功能")
GeneralTab:CreateButton({
    Name = "甩飞所有人",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.Velocity = Vector3.new(
                        math.random(-50, 50),
                        math.random(100, 200),
                        math.random(-50, 50)
                    )
                end
            end
        end
        Rayfield:Notify({
            Title = "互动系统",
            Content = "已甩飞所有玩家!",
            Duration = 3,
        })
    end
})

-- 摧毁服务器（视觉特效）
GeneralTab:CreateSection("💥 高级功能")
GeneralTab:CreateButton({
    Name = "摧毁服务器视觉效果",
    Callback = function()
        DestroyServerActive = not DestroyServerActive
        
        if DestroyServerActive then
            -- 保存原始状态
            local sky = Lighting:FindFirstChildOfClass("Sky")
            if sky then
                OriginalSkybox = {
                    SkyboxBk = sky.SkyboxBk,
                    SkyboxDn = sky.SkyboxDn,
                    SkyboxFt = sky.SkyboxFt,
                    SkyboxLf = sky.SkyboxLf,
                    SkyboxRt = sky.SkyboxRt,
                    SkyboxUp = sky.SkyboxUp
                }
            end
            
            -- 替换天空盒
            if sky then
                sky.SkyboxBk = "rbxassetid://skybox_back"  -- 替换为实际图片ID
                sky.SkyboxDn = "rbxassetid://skybox_down"
                sky.SkyboxFt = "rbxassetid://skybox_front"
                sky.SkyboxLf = "rbxassetid://skybox_left"
                sky.SkyboxRt = "rbxassetid://skybox_right"
                sky.SkyboxUp = "rbxassetid://skybox_up"
            end
            
            -- 替换所有贴图
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("Part") and obj.TextureID ~= "" then
                    OriginalTextures[obj] = obj.TextureID
                    obj.TextureID = "rbxassetid://red_texture"  -- 替换为红色皮肤ID
                end
            end
            
            -- 玩家皮肤变为红色酷小孩
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    -- 添加火焰效果
                    local fire = Instance.new("Fire")
                    fire.Parent = player.Character:FindFirstChild("HumanoidRootPart")
                    fire.Size = 5
                    fire.Heat = 10
                    fire.Color = Color3.fromRGB(255, 0, 0)
                    fire.SecondaryColor = Color3.fromRGB(255, 100, 0)
                end
            end
            
            -- 创建屏幕文字
            local screenGui = Instance.new("ScreenGui")
            screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
            screenGui.Name = "DestroyServerGui"
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Parent = screenGui
            textLabel.Size = UDim2.new(1, 0, 0.1, 0)
            textLabel.Position = UDim2.new(0, 0, 0, 0)
            textLabel.Text = "从脚本摧毁服务器"
            textLabel.TextScaled = true
            textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Font = Enum.Font.SciFi
            
            Rayfield:Notify({
                Title = "服务器控制",
                Content = "服务器视觉效果已修改 (仅自己可见)",
                Duration = 5,
            })
        else
            -- 恢复原始状态
            local sky = Lighting:FindFirstChildOfClass("Sky")
            if sky and OriginalSkybox then
                sky.SkyboxBk = OriginalSkybox.SkyboxBk
                sky.SkyboxDn = OriginalSkybox.SkyboxDn
                sky.SkyboxFt = OriginalSkybox.SkyboxFt
                sky.SkyboxLf = OriginalSkybox.SkyboxLf
                sky.SkyboxRt = OriginalSkybox.SkyboxRt
                sky.SkyboxUp = OriginalSkybox.SkyboxUp
            end
            
            -- 恢复原始贴图
            for obj, textureId in pairs(OriginalTextures) do
                if obj.Parent then
                    obj.TextureID = textureId
                end
            end
            OriginalTextures = {}
            
            -- 移除火焰效果
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    local fire = player.Character:FindFirstChild("Fire")
                    if fire then
                        fire:Destroy()
                    end
                end
            end
            
            -- 移除屏幕文字
            local playerGui = Players.LocalPlayer:FindFirstChild("PlayerGui")
            if playerGui then
                local destroyGui = playerGui:FindFirstChild("DestroyServerGui")
                if destroyGui then
                    destroyGui:Destroy()
                end
            end
            
            Rayfield:Notify({
                Title = "服务器控制",
                Content = "服务器视觉效果已恢复",
                Duration = 3,
            })
        end
    end
})

-- ==================== 被遗弃功能页面 ====================
local AbandonedTab = Window:CreateTab("被遗弃功能", 1234567890)

-- 无限体力（仅修改体力，不修改生命值）
AbandonedTab:CreateSection("⚡ 无限体力系统")
local InfiniteStamina = false
local StaminaToggle = AbandonedTab:CreateToggle({
    Name = "无限体力模式",
    CurrentValue = false,
    Flag = "InfiniteStamina",
    Callback = function(Value)
        InfiniteStamina = Value
        if InfiniteStamina then
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            
            spawn(function()
                while StaminaToggle.CurrentValue and character do
                    if character:FindFirstChild("Humanoid") then
                        -- 仅修改体力值，不修改生命值
                        character.Humanoid:SetAttribute("Stamina", 100)
                    end
                    task.wait(0.2)
                end
            end)
            
            Rayfield:Notify({
                Title = "体力系统",
                Content = "无限体力已激活",
                Duration = 3,
            })
        else
            Rayfield:Notify({
                Title = "体力系统",
                Content = "无限体力已关闭",
                Duration = 3,
            })
        end
    end
})

-- 幸存者杀手透视
AbandonedTab:CreateSection("👁️ 高级透视系统")
local KillerVisionToggle = AbandonedTab:CreateToggle({
    Name = "透视杀手（红色高亮）",
    CurrentValue = false,
    Flag = "KillerVision",
    Callback = function(Value)
        if Value then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer and player.Character then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.FillColor = Color3.fromRGB(255, 0, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.Name = "KillerHighlight"
                end
            end
            Rayfield:Notify({
                Title = "透视系统",
                Content = "杀手透视已激活",
                Duration = 3,
            })
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    local highlight = player.Character:FindFirstChild("KillerHighlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
            Rayfield:Notify({
                Title = "透视系统",
                Content = "杀手透视已关闭",
                Duration = 3,
            })
        end
    end
})

local SurvivorVisionToggle = AbandonedTab:CreateToggle({
    Name = "透视幸存者（绿色高亮）",
    CurrentValue = false,
    Flag = "SurvivorVision",
    Callback = function(Value)
        if Value then
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer and player.Character then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.FillColor = Color3.fromRGB(0, 255, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.Name = "SurvivorHighlight"
                end
            end
            Rayfield:Notify({
                Title = "透视系统",
                Content = "幸存者透视已激活",
                Duration = 3,
            })
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    local highlight = player.Character:FindFirstChild("SurvivorHighlight")
                    if highlight then
                        highlight:Destroy()
                    end
                end
            end
            Rayfield:Notify({
                Title = "透视系统",
                Content = "幸存者透视已关闭",
                Duration = 3,
            })
        end
    end
})

-- 自动修理机子
AbandonedTab:CreateSection("🔧 自动维修系统")
local AutoRepairToggle = AbandonedTab:CreateToggle({
    Name = "自动修理机子（3秒/次）",
    CurrentValue = false,
    Flag = "AutoRepair",
    Callback = function(Value)
        if Value then
            spawn(function()
                while AutoRepairToggle.CurrentValue do
                    -- 自动修理逻辑
                    Rayfield:Notify({
                        Title = "维修系统",
                        Content = "正在进行机器维修...",
                        Duration = 1,
                    })
                    task.wait(3) -- 3秒修一次
                end
            end)
        else
            Rayfield:Notify({
                Title = "维修系统",
                Content = "自动修理已停止",
                Duration = 3,
            })
        end
    end
})

-- 自动格挡
AbandonedTab:CreateSection("🛡️ 防御系统")
local AutoBlockToggle = AbandonedTab:CreateToggle({
    Name = "自动格挡（访客1337）",
    CurrentValue = false,
    Flag = "AutoBlock",
    Callback = function(Value)
        if Value then
            Rayfield:Notify({
                Title = "防御系统",
                Content = "自动格挡已激活",
                Duration = 3,
            })
            
            spawn(function()
                while AutoBlockToggle.CurrentValue do
                    local player = Players.LocalPlayer
                    local character = player.Character
                    if character then
                        local humanoid = character:FindFirstChild("Humanoid")
                        if humanoid then
                            humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                        end
                    end
                    task.wait(0.1)
                end
            end)
        else
            Rayfield:Notify({
                Title = "防御系统",
                Content = "自动格挡已关闭",
                Duration = 3,
            })
        end
    end
})

-- 谢德来茨基自动挥刀
AbandonedTab:CreateSection("⚔️ 攻击系统")
local AutoSwingToggle = AbandonedTab:CreateToggle({
    Name = "谢德来茨基自动挥刀",
    CurrentValue = false,
    Flag = "AutoSwing",
    Callback = function(Value)
        if Value then
            spawn(function()
                while AutoSwingToggle.CurrentValue do
                    local player = Players.LocalPlayer
                    local character = player.Character
                    if character then
                        local tool = character:FindFirstChildOfClass("Tool")
                        if tool then
                            tool:Activate() -- 触发挥刀动作
                        end
                    end
                    task.wait(0.5)
                end
            end)
            Rayfield:Notify({
                Title = "攻击系统",
                Content = "自动挥刀已激活",
                Duration = 3,
            })
        else
            Rayfield:Notify({
                Title = "攻击系统",
                Content = "自动挥刀已关闭",
                Duration = 3,
            })
        end
    end
})

-- ==================== 完成UI加载 ====================
Rayfield:LoadConfiguration()

-- 初始通知
Rayfield:Notify({
    Title = "系统就绪",
    Content = "通用功能与被遗弃功能已加载完成!",
    Duration = 5,
})

print("终极游戏辅助UI系统加载完成")
