-- =============================================
-- 智能UI集成系统：普通功能 + 手动激活高级功能
-- =============================================

local Players = game:GetService("Players")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 状态跟踪：防止重复加载高级功能
local AdvancedFeaturesLoaded = false
local AdvancedTab = nil

-- 创建主窗口
local Window = Rayfield:CreateWindow({
    Name = "🎮 智能游戏辅助系统",
    LoadingTitle = "系统初始化中...",
    LoadingSubtitle = "基础功能加载完成，高级功能需手动激活",
    ConfigurationSaving = {Enabled = true, FolderName = "SmartUI", FileName = "Config"},
    KeySystem = false,
})

-- ==================== 普通UI功能（始终可用） ====================
local MainTab = Window:CreateTab("核心功能", 4483362458)

-- 飞行系统
local FlightSection = MainTab:CreateSection("飞行系统")
local FlightToggle = MainTab:CreateToggle({
    Name = "✈️ 飞行模式",
    CurrentValue = false,
    Flag = "FlightMode",
    Callback = function(Value)
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        
        if Value and humanoidRootPart then
            humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
            humanoidRootPart.Gravity = 0
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

-- 移动速度调整
local SpeedSection = MainTab:CreateSection("移动设置")
local SpeedSlider = MainTab:CreateSlider({
    Name = "🚀 移动速度",
    Range = {16, 200},
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

-- 基础透视功能
local VisionSection = MainTab:CreateSection("视觉增强")
local BasicVisionToggle = MainTab:CreateToggle({
    Name = "👁️ 基础透视",
    CurrentValue = false,
    Flag = "BasicVision",
    Callback = function(Value)
        if Value then
            -- 基础透视实现
            Rayfield:Notify({
                Title = "视觉系统",
                Content = "基础透视已激活",
                Duration = 3,
            })
        else
            Rayfield:Notify({
                Title = "视觉系统",
                Content = "基础透视已关闭", 
                Duration = 3,
            })
        end
    end
})

-- ==================== 脚本库标签页 ====================
local ScriptsTab = Window:CreateTab("脚本库", 9876543210)

-- 被遗弃服务器功能激活按钮
local AbandonedScriptSection = ScriptsTab:CreateSection("高级功能激活")
local AbandonedScriptButton = ScriptsTab:CreateButton({
    Name = "🔥 激活被遗弃服务器高级功能",
    Callback = function()
        loadAbandonedServerFeatures()
    end
})

-- 其他脚本按钮
local ExternalScriptsSection = ScriptsTab:CreateSection("外部脚本")
local PiScriptButton = ScriptsTab:CreateButton({
    Name = "🥧 加载皮脚本",
    Callback = function()
        getgenv().XiaoPi = "皮脚本QQ群1002100032"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
        Rayfield:Notify({
            Title = "脚本加载",
            Content = "皮脚本已执行",
            Duration = 3,
        })
    end
})

local InkGameButton = ScriptsTab:CreateButton({
    Name = "🖌️ 加载墨水游戏",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/13222222fcc/-qwqee/main/script.lua"))()
        Rayfield:Notify({
            Title = "脚本加载", 
            Content = "墨水游戏脚本已执行",
            Duration = 3,
        })
    end
})

-- ==================== 被遗弃服务器高级功能加载器 ====================
local function loadAbandonedServerFeatures()
    -- 防止重复加载
    if AdvancedFeaturesLoaded then
        Rayfield:Notify({
            Title = "系统提示",
            Content = "高级功能已经加载了哦！",
            Duration = 3,
        })
        return
    end
    
    AdvancedFeaturesLoaded = true
    
    -- 创建高级功能标签页
    AdvancedTab = Window:CreateTab("🔥 高级功能", 1234567890)
    
    -- 1. 无限体力系统
    local StaminaSection = AdvancedTab:CreateSection("无限体力系统")
    local StaminaToggle = AdvancedTab:CreateToggle({
        Name = "⚡ 无限体力模式",
        CurrentValue = false,
        Flag = "InfiniteStamina",
        Callback = function(Value)
            if Value then
                local player = Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                
                -- 启动无限体力监控
                spawn(function()
                    while StaminaToggle.CurrentValue and character do
                        if character:FindFirstChild("Humanoid") then
                            character.Humanoid:SetAttribute("Stamina", 100)
                            character.Humanoid.Health = 100
                        end
                        task.wait(0.2)
                    end
                end)
                
                Rayfield:Notify({
                    Title = "无限体力",
                    Content = "无限体力模式已激活",
                    Duration = 3,
                })
            else
                Rayfield:Notify({
                    Title = "无限体力",
                    Content = "无限体力模式已关闭",
                    Duration = 3,
                })
            end
        end
    })
    
    -- 2. 高级透视系统
    local AdvancedVisionSection = AdvancedTab:CreateSection("高级透视系统")
    
    local KillerVisionToggle = AdvancedTab:CreateToggle({
        Name = "🔴 透视杀手（红色高亮）",
        CurrentValue = false,
        Flag = "KillerVision",
        Callback = function(Value)
            if Value then
                -- 杀手透视逻辑
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= Players.LocalPlayer and player.Character then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.Name = "KillerHighlight"
                    end
                end
            else
                -- 清理透视效果
                for _, player in ipairs(Players:GetPlayers()) do
                    if player.Character then
                        local highlight = player.Character:FindFirstChild("KillerHighlight")
                        if highlight then
                            highlight:Destroy()
                        end
                    end
                end
            end
        end
    })
    
    local SurvivorVisionToggle = AdvancedTab:CreateToggle({
        Name = "🟢 透视幸存者（绿色高亮）",
        CurrentValue = false,
        Flag = "SurvivorVision", 
        Callback = function(Value)
            if Value then
                -- 幸存者透视逻辑
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= Players.LocalPlayer and player.Character then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.FillColor = Color3.fromRGB(0, 255, 0)
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.Name = "SurvivorHighlight"
                    end
                end
            else
                -- 清理透视效果
                for _, player in ipairs(Players:GetPlayers()) do
                    if player.Character then
                        local highlight = player.Character:FindFirstChild("SurvivorHighlight")
                        if highlight then
                            highlight:Destroy()
                        end
                    end
                end
            end
        end
    })
    
    -- 3. 攻击箱追踪系统
    local TrackingSection = AdvancedTab:CreateSection("攻击箱追踪")
    local AttackBoxTracker = AdvancedTab:CreateToggle({
        Name = "🎯 攻击箱实时追踪",
        CurrentValue = false,
        Flag = "AttackBoxTracker",
        Callback = function(Value)
            if Value then
                -- 启动追踪逻辑
                spawn(function()
                    while AttackBoxTracker.CurrentValue do
                        for _, obj in ipairs(workspace:GetChildren()) do
                            if string.find(string.lower(obj.Name), "attack") or 
                               string.find(string.lower(obj.Name), "box") or
                               string.find(string.lower(obj.Name), "weapon") then
                               
                                if not obj:FindFirstChild("TrackerBeam") then
                                    local beam = Instance.new("Beam")
                                    beam.Name = "TrackerBeam"
                                    beam.Parent = obj
                                    beam.Color = ColorSequence.new(Color3.fromRGB(255, 255, 0))
                                    beam.Width0 = 0.5
                                    beam.Width1 = 0.5
                                    
                                    local attachment0 = Instance.new("Attachment")
                                    attachment0.Parent = obj
                                    local attachment1 = Instance.new("Attachment") 
                                    attachment1.Parent = obj
                                    attachment1.Position = Vector3.new(0, 5, 0)
                                    
                                    beam.Attachment0 = attachment0
                                    beam.Attachment1 = attachment1
                                end
                            end
                        end
                        task.wait(1)
                    end
                end)
            else
                -- 清理追踪效果
                for _, obj in ipairs(workspace:GetChildren()) do
                    local beam = obj:FindFirstChild("TrackerBeam")
                    if beam then
                        beam:Destroy()
                    end
                    local attachment0 = obj:FindFirstChild("Attachment")
                    if attachment0 then
                        attachment0:Destroy()
                    end
                    local attachment1 = obj:FindFirstChild("Attachment")
                    if attachment1 then
                        attachment1:Destroy()
                    end
                end
            end
        end
    })
    
    -- 成功加载通知
    Rayfield:Notify({
        Title = "系统通知",
        Content = "🎉 被遗弃服务器高级功能已激活！请查看新增的'高级功能'标签页",
        Duration = 5,
    })
    
    print("高级功能标签页已创建并加载")
end

-- ==================== 系统设置标签页 ====================
local SettingsTab = Window:CreateTab("设置", 1122334455)

local InfoSection = SettingsTab:CreateSection("系统信息")
SettingsTab:CreateLabel({
    Name = "高级功能状态: " .. (AdvancedFeaturesLoaded and "已激活" or "未激活"),
    Flag = "AdvancedStatusLabel"
})

local ResetSection = SettingsTab:CreateSection("系统维护")
local RefreshButton = SettingsTab:CreateButton({
    Name = "🔄 刷新状态显示",
    Callback = function()
        Rayfield:Notify({
            Title = "系统状态",
            Content = "高级功能状态: " .. (AdvancedFeaturesLoaded and "已激活" or "未激活"),
            Duration = 3,
        })
    end
})

-- 完成UI加载
Rayfield:LoadConfiguration()

-- 初始通知
Rayfield:Notify({
    Title = "系统就绪",
    Content = "基础功能已加载完成！请在脚本库中手动激活高级功能",
    Duration = 5,
})

print("智能UI系统加载完成 - 基础功能可用，高级功能需手动激活")
