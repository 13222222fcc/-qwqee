-- 服务器检测与UI管理系统
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

-- 被遗弃服务器ID列表（请根据实际情况修改）
local ABANDONED_SERVER_IDS = {
    "1234567890",
    "0987654321", 
    "1111111111",
    "2222222222"
}

-- 检测当前服务器类型
local function detectServerType()
    local serverId = game.JobId
    for _, abandonedId in ipairs(ABANDONED_SERVER_IDS) do
        if serverId == abandonedId then
            return "ABANDONED"
        end
    end
    return "NORMAL"
end

-- 加载Rayfield UI库
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 被遗弃服务器专属UI
local function createAbandonedServerUI()
    local Window = Rayfield:CreateWindow({
        Name = "🔥 遗弃服务器专属面板",
        LoadingTitle = "检测到遗弃服务器",
        LoadingSubtitle = "高级功能已解锁",
        ConfigurationSaving = {Enabled = true, FolderName = "AbandonedUI", FileName = "Config"},
        KeySystem = false
    })

    local MainTab = Window:CreateTab("核心功能", 1234567890)
    
    -- 功能1: 无限体力
    local InfiniteStaminaSection = MainTab:CreateSection("无限体力系统")
    local StaminaToggle = MainTab:CreateToggle({
        Name = "⚡ 无限体力模式",
        CurrentValue = false,
        Flag = "InfiniteStamina",
        Callback = function(Value)
            if Value then
                local player = Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                
                while StaminaToggle.CurrentValue and character do
                    -- 模拟无限体力效果
                    if character:FindFirstChild("Humanoid") then
                        character.Humanoid:SetAttribute("Stamina", 100)
                    end
                    task.wait(0.1)
                end
            end
        end
    })

    -- 功能2: 透视杀手和幸存者
    local VisionSection = MainTab:CreateSection("高级透视系统")
    local KillerVisionToggle = MainTab:CreateToggle({
        Name = "👁️ 透视杀手",
        CurrentValue = false,
        Flag = "KillerVision",
        Callback = function(Value)
            if Value then
                -- 杀手透视逻辑
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= Players.LocalPlayer and player.Character then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)  -- 红色表示杀手
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    end
                end
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
            end
        end
    })

    local SurvivorVisionToggle = MainTab:CreateToggle({
        Name = "👥 透视幸存者", 
        CurrentValue = false,
        Flag = "SurvivorVision",
        Callback = function(Value)
            if Value then
                -- 幸存者透视逻辑
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= Players.LocalPlayer and player.Character then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.FillColor = Color3.fromRGB(0, 255, 0)  -- 绿色表示幸存者
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    end
                end
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
            end
        end
    })

    -- 功能3: 攻击箱追踪
    local TrackingSection = MainTab:CreateSection("攻击箱追踪系统")
    local AttackBoxTracker = MainTab:CreateToggle({
        Name = "🎯 攻击箱追踪",
        CurrentValue = false,
        Flag = "AttackBoxTracker",
        Callback = function(Value)
            if Value then
                -- 攻击箱追踪逻辑
                while AttackBoxTracker.CurrentValue do
                    for _, obj in ipairs(workspace:GetChildren()) do
                        if string.find(string.lower(obj.Name), "attack") or string.find(string.lower(obj.Name), "box") then
                            if not obj:FindFirstChild("TrackerBeam") then
                                local beam = Instance.new("Beam")
                                beam.Name = "TrackerBeam"
                                beam.Parent = obj
                                beam.Color = ColorSequence.new(Color3.fromRGB(255, 255, 0))
                                beam.Width0 = 0.5
                                beam.Width1 = 0.5
                            end
                        end
                    end
                    task.wait(1)
                end
            else
                -- 清理追踪效果
                for _, obj in ipairs(workspace:GetChildren()) do
                    local beam = obj:FindFirstChild("TrackerBeam")
                    if beam then
                        beam:Destroy()
                    end
                end
            end
        end
    })

    Rayfield:LoadConfiguration()
    return Window
end

-- 普通服务器标准UI
local function createNormalServerUI()
    local Window = Rayfield:CreateWindow({
        Name = "🛡️ 标准服务器面板",
        LoadingTitle = "标准功能加载中",
        LoadingSubtitle = "基础功能可用",
        ConfigurationSaving = {Enabled = true, FolderName = "NormalUI", FileName = "Config"},
        KeySystem = false
    })

    local MainTab = Window:CreateTab("主要功能", 1234567890)
    
    -- 飞行功能
    local FlightSection = MainTab:CreateSection("飞行系统")
    local FlightToggle = MainTab:CreateToggle({
        Name = "✈️ 飞行模式",
        CurrentValue = false,
        Flag = "FlightMode",
        Callback = function(Value)
            -- 飞行功能实现
        end
    })

    -- 速度调整
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

    -- 其他脚本标签页
    local ScriptsTab = Window:CreateTab("其他脚本", 1234567891)
    local PiScriptButton = ScriptsTab:CreateButton({
        Name = "🥧 皮脚本",
        Callback = function()
            getgenv().XiaoPi = "皮脚本QQ群1002100032"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
        end
    })

    local InkGameButton = ScriptsTab:CreateButton({
        Name = "🖌️ 墨水游戏",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/13222222fcc/-qwqee/main/script.lua"))()
        end
    })

    Rayfield:LoadConfiguration()
    return Window
end

-- 主执行逻辑
local function main()
    local serverType = detectServerType()
    print("检测到服务器类型: " .. serverType)
    
    if serverType == "ABANDONED" then
        print("加载遗弃服务器专属UI...")
        createAbandonedServerUI()
    else
        print("加载普通服务器标准UI...")
        createNormalServerUI()
    end
end

-- 启动脚本
local success, errorMessage = pcall(main)
if not success then
    warn("UI加载错误: " .. errorMessage)
end
