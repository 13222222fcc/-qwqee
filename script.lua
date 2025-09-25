-- =============================================
-- 多功能游戏辅助UI系统
-- 基于链接内容生成
-- =============================================

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

-- 加载Rayfield UI库
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 创建主窗口
local Window = Rayfield:CreateWindow({
    Name = "🎮 多功能游戏辅助系统",
    LoadingTitle = "系统初始化中...",
    LoadingSubtitle = "正在加载功能模块",
    ConfigurationSaving = {Enabled = true, FolderName = "MultiTool", FileName = "Config"},
    KeySystem = false,
})

-- ==================== 核心功能标签页 ====================
local MainTab = Window:CreateTab("核心功能", 4483362458)

-- 甩飞所有人功能
local ThrowSection = MainTab:CreateSection("甩飞系统")
local ThrowAllButton = MainTab:CreateButton({
    Name = "🌀 甩飞所有人",
    Callback = function()
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.Velocity = Vector3.new(0, 100, 0)
                end
            end
        end
        Rayfield:Notify({
            Title = "甩飞系统",
            Content = "已甩飞所有玩家",
            Duration = 3,
            Image = 4483362458
        })
    end
})

-- 移动速度调整
local SpeedSection = MainTab:CreateSection("移动设置")
local SpeedSlider = MainTab:CreateSlider({
    Name = "🚀 移动速度",
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

-- 透视功能
local VisionSection = MainTab:CreateSection("透视系统")
local VisionToggle = MainTab:CreateToggle({
    Name = "👁️ 透视玩家",
    CurrentValue = false,
    Flag = "PlayerVision",
    Callback = function(Value)
        if Value then
            -- 透视逻辑
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer and player.Character then
                    local highlight = Instance.new("Highlight")
                    highlight.Parent = player.Character
                    highlight.FillColor = Color3.fromRGB(255, 100, 100)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                end
            end
            Rayfield:Notify({
                Title = "透视系统",
                Content = "玩家透视已激活",
                Duration = 3,
                Image = 4483362458
            })
        else
            -- 清理透视效果
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Character then
                    for _, obj in ipairs(player.Character:GetChildren()) do
                        if obj:IsA("Highlight") then
                            obj:Destroy()
                        end
                    end
                end
            end
            Rayfield:Notify({
                Title = "透视系统",
                Content = "玩家透视已关闭",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

-- 飞行功能
local FlightSection = MainTab:CreateSection("飞行系统")
local FlightToggle = MainTab:CreateToggle({
    Name = "✈️ 飞行模式",
    CurrentValue = false,
    Flag = "FlightMode",
    Callback = function(Value)
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        
        if Value then
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                humanoidRootPart.Gravity = 0
            end
            Rayfield:Notify({
                Title = "飞行系统",
                Content = "飞行模式已激活",
                Duration = 3,
                Image = 4483362458
            })
        else
            local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                humanoidRootPart.Gravity = 196.2 -- 默认重力
            end
            Rayfield:Notify({
                Title = "飞行系统",
                Content = "飞行模式已关闭",
                Duration = 3,
                Image = 4483362458
            })
        end
    end
})

-- ==================== 脚本库标签页 ====================
local ScriptsTab = Window:CreateTab("脚本库", 9876543210)

-- 皮脚本
local PiScriptSection = ScriptsTab:CreateSection("皮脚本")
local PiScriptButton = ScriptsTab:CreateButton({
    Name = "🥧 执行皮脚本",
    Callback = function()
        getgenv().XiaoPi = "皮脚本QQ群1002100032"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
        Rayfield:Notify({
            Title = "脚本执行",
            Content = "皮脚本已加载",
            Duration = 3,
            Image = 9876543210
        })
    end
})

-- 墨水游戏脚本
local InkGameSection = ScriptsTab:CreateSection("墨水游戏")
local InkGameButton = ScriptsTab:CreateButton({
    Name = "🖌️ 执行墨水游戏脚本",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/13222222fcc/-qwqee/main/script.lua"))()
        Rayfield:Notify({
            Title = "脚本执行",
            Content = "墨水游戏脚本已加载",
            Duration = 3,
            Image = 9876543210
        })
    end
})

-- ==================== 设置标签页 ====================
local SettingsTab = Window:CreateTab("设置", 1234567890)

-- 服务器信息
local InfoSection = SettingsTab:CreateSection("服务器信息")
local ServerIdLabel = SettingsTab:CreateLabel({
    Name = "服务器ID: " .. tostring(game.PlaceId),
    Flag = "ServerIdLabel"
})

-- 重置设置
local ResetSection = SettingsTab:CreateSection("系统设置")
local ResetButton = SettingsTab:CreateButton({
    Name = "🔄 重置所有设置",
    Callback = function()
        Rayfield:ResetConfiguration()
        Rayfield:Notify({
            Title = "系统设置",
            Content = "所有设置已重置为默认值",
            Duration = 3,
            Image = 1234567890
        })
    end
})

-- ==================== 完成UI加载 ====================
Rayfield:LoadConfiguration()

-- 显示欢迎消息
Rayfield:Notify({
    Title = "系统就绪",
    Content = "多功能游戏辅助系统已加载完成！",
    Duration = 5,
    Image = 4483362458
})

print("多功能游戏辅助系统已成功加载")
