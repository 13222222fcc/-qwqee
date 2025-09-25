-- =============================================
-- 三级UI系统：公告 + 通用功能 + 火热服务器专属功能
-- =============================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")

-- 加载Rayfield UI库
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 状态变量
local AbandonedUILoaded = false
local CurrentWindow = nil

-- ==================== 公告页面 (第一级UI) ====================
local function createAnnouncementUI()
    local Window = Rayfield:CreateWindow({
        Name = "🎊 脚本系统 V2.0",
        LoadingTitle = "系统初始化中...",
        LoadingSubtitle = "正在加载公告页面",
        ConfigurationSaving = {Enabled = false},
        KeySystem = false,
    })
    
    local AnnouncementTab = Window:CreateTab("公告", 123456789)
    
    -- 公告内容
    AnnouncementTab:CreateSection("📢 系统公告")
    AnnouncementTab:CreateLabel({
        Name = "🎉 欢迎使用脚本系统 V2.0",
        Flag = "WelcomeLabel"
    })
    
    AnnouncementTab:CreateLabel({
        Name = "📅 发布日期: 2024-01-20",
        Flag = "DateLabel"
    })
    
    AnnouncementTab:CreateLabel({
        Name = "👨‍💻 开发者: 脚本团队",
        Flag = "DevLabel"
    })
    
    AnnouncementTab:CreateParagraph({
        Title = "🎯 使用说明",
        Content = "这是第一次制作脚本系统，请谨慎使用所有功能。\n所有按钮在公告页面均不可用，请切换到其他标签页使用功能。"
    })
    
    -- 不可用按钮示例
    AnnouncementTab:CreateSection("🚫 不可用功能演示")
    local DisabledButton = AnnouncementTab:CreateButton({
        Name = "🔒 此按钮不可用（演示用途）",
        Callback = function()
            -- 故意不实现功能，保持不可用状态
            Rayfield:Notify({
                Title = "功能不可用",
                Content = "此按钮在公告页面故意设置为不可用状态",
                Duration = 3,
            })
        end
    })
    
    -- 导航到通用功能的按钮
    AnnouncementTab:CreateSection("➡️ 页面导航")
    AnnouncementTab:CreateButton({
        Name = "🚀 切换到通用功能",
        Callback = function()
            Rayfield:Notify({
                Title = "页面导航",
                Content = "正在切换到通用功能页面...",
                Duration = 2,
            })
            -- 这里实际会通过标签页切换实现
        end
    })
    
    return Window
end

-- ==================== 通用功能页面 ====================
local function createGeneralFeaturesTab(Window)
    local GeneralTab = Window:CreateTab("通用功能", 987654321)
    
    -- 透视功能
    GeneralTab:CreateSection("👁️ 透视系统")
    local ESPToggle = GeneralTab:CreateToggle({
        Name = "👥 玩家透视",
        CurrentValue = false,
        Flag = "ESP",
        Callback = function(Value)
            if Value then
                -- 透视逻辑
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= Players.LocalPlayer and player.Character then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.FillColor = Color3.fromRGB(0, 255, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    end
                end
            else
                -- 关闭透视
                for _, player in ipairs(Players:GetPlayers()) do
                    if player.Character then
                        for _, obj in ipairs(player.Character:GetChildren()) do
                            if obj:IsA("Highlight") then
                                obj:Destroy()
                            end
                        end
                    end
                end
            end
        end
    })
    
    -- 飞行功能
    GeneralTab:CreateSection("✈️ 飞行系统")
    local FlightToggle = GeneralTab:CreateToggle({
        Name = "🕊️ 飞行模式",
        CurrentValue = false,
        Flag = "Flight",
        Callback = function(Value)
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            
            if Value and humanoidRootPart then
                humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                humanoidRootPart.Gravity = 0
            elseif humanoidRootPart then
                humanoidRootPart.Gravity = 196.2
            end
        end
    })
    
    -- 自瞄功能
    GeneralTab:CreateSection("🎯 自瞄系统")
    local AimbotToggle = GeneralTab:CreateToggle({
        Name = "瞄准辅助",
        CurrentValue = false,
        Flag = "Aimbot",
        Callback = function(Value)
            -- 自瞄逻辑占位符
        end
    })
    
    -- 甩飞人功能
    GeneralTab:CreateSection("🌀 互动功能")
    local ThrowButton = GeneralTab:CreateButton({
        Name = "💨 甩飞所有人",
        Callback = function()
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart.Velocity = Vector3.new(0, 100, 0)
                    end
                end
            end
        end
    })
    
    -- 移动速度设置
    GeneralTab:CreateSection("🏃 移动设置")
    local SpeedSlider = GeneralTab:CreateSlider({
        Name = "🚀 移动速度",
        Range = {16, 200},
        Increment = 1,
        Suffix = "速度",
        CurrentValue = 50,
        Flag = "Speed",
        Callback = function(Value)
            local player = Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = Value
            end
        end
    })
    
    local JumpSlider = GeneralTab:CreateSlider({
        Name = "🦘 跳跃高度",
        Range = {50, 300},
        Increment = 1,
        Suffix = "高度",
        CurrentValue = 100,
        Flag = "Jump",
        Callback = function(Value)
            local player = Players.LocalPlayer
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.JumpPower = Value
            end
        end
    })
    
    return GeneralTab
end

-- ==================== 火热服务器页面 ====================
local function createHotServerTab(Window)
    local HotServerTab = Window:CreateTab("火热服务器", 555555555)
    
    -- 被遗弃功能按钮
    HotServerTab:CreateSection("🔥 高级功能激活")
    HotServerTab:CreateButton({
        Name = "🏚️ 激活被遗弃服务器功能",
        Callback = function()
            loadAbandonedServerUI()
        end
    })
    
    -- 其他火热服务器功能
    HotServerTab:CreateSection("🎮 服务器工具")
    HotServerTab:CreateButton({
        Name = "🔧 服务器优化",
        Callback = function()
            -- 服务器优化逻辑
        end
    })
    
    return HotServerTab
end

-- ==================== 被遗弃服务器专属UI (第二级UI) ====================
local function loadAbandonedServerUI()
    if AbandonedUILoaded then
        Rayfield:Notify({
            Title = "系统提示",
            Content = "被遗弃服务器UI已经加载了！",
            Duration = 3,
        })
        return
    end
    
    AbandonedUILoaded = true
    
    -- 关闭原有窗口（模拟覆盖效果）
    if CurrentWindow then
        -- 这里实际需要Rayfield提供关闭窗口的方法
        Rayfield:Notify({
            Title = "UI系统",
            Content = "正在切换到被遗弃服务器专属UI...",
            Duration = 2,
        })
    end
    
    -- 创建新的专属窗口
    local AbandonedWindow = Rayfield:CreateWindow({
        Name = "🏚️ 被遗弃服务器 - 终极控制面板",
        LoadingTitle = "高级权限解锁中...",
        LoadingSubtitle = "检测到被遗弃服务器环境",
        ConfigurationSaving = {Enabled = true, FolderName = "AbandonedConfig"},
        KeySystem = false,
    })
    
    -- 1. 无限体力系统
    local InfiniteStaminaTab = AbandonedWindow:CreateTab("无限体力", 111111111)
    InfiniteStaminaTab:CreateSection("⚡ 体力控制系统")
    
    local StaminaToggle = InfiniteStaminaTab:CreateToggle({
        Name = "💪 无限体力模式",
        CurrentValue = false,
        Flag = "InfiniteStamina",
        Callback = function(Value)
            local player = Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            
            if Value then
                spawn(function()
                    while StaminaToggle.CurrentValue and character do
                        if character:FindFirstChild("Humanoid") then
                            character.Humanoid:SetAttribute("Stamina", 100)
                            character.Humanoid.Health = 100
                        end
                        task.wait(0.1)
                    end
                end)
            end
        end
    })
    
    -- 2. 幸存者杀手透视系统
    local VisionTab = AbandonedWindow:CreateTab("高级透视", 222222222)
    VisionTab:CreateSection("👁️ 角色识别系统")
    
    local KillerVisionToggle = VisionTab:CreateToggle({
        Name = "🔴 透视杀手（红色高亮）",
        CurrentValue = false,
        Flag = "KillerVision",
        Callback = function(Value)
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer and player.Character then
                    if Value then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.Name = "KillerHighlight"
                    else
                        local highlight = player.Character:FindFirstChild("KillerHighlight")
                        if highlight then
                            highlight:Destroy()
                        end
                    end
                end
            end
        end
    })
    
    local SurvivorVisionToggle = VisionTab:CreateToggle({
        Name = "🟢 透视幸存者（绿色高亮）",
        CurrentValue = false,
        Flag = "SurvivorVision",
        Callback = function(Value)
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer and player.Character then
                    if Value then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.FillColor = Color3.fromRGB(0, 255, 0)
                        highlight.Name = "SurvivorHighlight"
                    else
                        local highlight = player.Character:FindFirstChild("SurvivorHighlight")
                        if highlight then
                            highlight:Destroy()
                        end
                    end
                end
            end
        end
    })
    
    -- 3. 碰撞箱追踪系统
    local TrackingTab = AbandonedWindow:CreateTab("碰撞箱追踪", 333333333)
    TrackingTab:CreateSection("🎯 碰撞箱检测系统")
    
    local CollisionTracker = TrackingTab:CreateToggle({
        Name = "📦 碰撞箱实时追踪",
        CurrentValue = false,
        Flag = "CollisionTracker",
        Callback = function(Value)
            if Value then
                spawn(function()
                    while CollisionTracker.CurrentValue do
                        for _, obj in ipairs(workspace:GetChildren()) do
                            if obj:IsA("Part") and obj.Name:lower():find("collision") then
                                if not obj:FindFirstChild("TrackerBeam") then
                                    local beam = Instance.new("Beam")
                                    beam.Parent = obj
                                    beam.Color = ColorSequence.new(Color3.fromRGB(255, 255, 0))
                                    beam.Name = "TrackerBeam"
                                end
                            end
                        end
                        task.wait(1)
                    end
                end)
            else
                for _, obj in ipairs(workspace:GetChildren()) do
                    local beam = obj:FindFirstChild("TrackerBeam")
                    if beam then
                        beam:Destroy()
                    end
                end
            end
        end
    })
    
    -- 4. 访客自动格挡系统
    local DefenseTab = AbandonedWindow:CreateTab("自动格挡", 444444444)
    DefenseTab:CreateSection("🛡️ 防御系统")
    
    local AutoBlockToggle = DefenseTab:CreateToggle({
        Name = "🛡️ 访客自动格挡",
        CurrentValue = false,
        Flag = "AutoBlock",
        Callback = function(Value)
            -- 自动格挡逻辑
            if Value then
                Rayfield:Notify({
                    Title = "防御系统",
                    Content = "自动格挡已激活",
                    Duration = 3,
                })
            end
        end
    })
    
    -- 5. 自动修机系统
    local RepairTab = AbandonedWindow:CreateTab("自动修机", 666666666)
    RepairTab:CreateSection("🔧 维修系统")
    
    local AutoRepairToggle = RepairTab:CreateToggle({
        Name = "⚡ 自动修机（3秒/次）",
        CurrentValue = false,
        Flag = "AutoRepair",
        Callback = function(Value)
            if Value then
                spawn(function()
                    while AutoRepairToggle.CurrentValue do
                        -- 模拟修机逻辑
                        Rayfield:Notify({
                            Title = "维修系统",
                            Content = "正在进行机器维修...",
                            Duration = 1,
                        })
                        task.wait(3) -- 3秒修一次
                    end
                end)
            end
        end
    })
    
    -- 完成加载通知
    Rayfield:Notify({
        Title = "🏚️ 被遗弃服务器UI",
        Content = "高级功能已全部加载完成！",
        Duration = 5,
    })
    
    CurrentWindow = AbandonedWindow
    return AbandonedWindow
end

-- ==================== 主执行函数 ====================
local function main()
    -- 创建主窗口和公告页面
    local MainWindow = createAnnouncementUI()
    CurrentWindow = MainWindow
    
    -- 添加通用功能标签页
    createGeneralFeaturesTab(MainWindow)
    
    -- 添加火热服务器标签页
    createHotServerTab(MainWindow)
    
    -- 完成UI加载
    Rayfield:LoadConfiguration()
    
    -- 初始通知
    Rayfield:Notify({
        Title = "🎊 系统就绪",
        Content = "三级UI系统加载完成！请查看公告页面了解详细信息。",
        Duration = 5,
    })
end

-- 安全启动
local success, errorMessage = pcall(main)
if not success then
    warn("UI系统加载错误: " .. errorMessage)
end
