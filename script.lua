local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")

-- 被遗弃服务器ID列表
local ABANDONED_SERVER_IDS = {
    ["6331902150"] = true,  -- 您确认的被遗弃服
    -- 您可以继续添加其他被遗弃服务器的ID
    -- ["另一个被遗弃服ID"] = true,
}

-- 检测当前服务器类型
local function getServerType()
    local placeId = tostring(game.PlaceId) -- 获取当前服务器的PlaceId[6](@ref)
    
    if ABANDONED_SERVER_IDS[placeId] then
        return "ABANDONED"
    else
        return "NORMAL"
    end
end

-- 被遗弃服务器专属UI功能
local function loadAbandonedServerUI()
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
    local Window = Rayfield:CreateWindow({
        Name = "🏚️ 遗弃服务器 - 高级控制面板",
        LoadingTitle = "检测到遗弃服务器环境",
        LoadingSubtitle = "终极权限已解锁",
        ConfigurationSaving = {Enabled = true, FolderName = "AbandonedServerConfig", FileName = "Settings"},
        KeySystem = false,
    })
    
    local MainTab = Window:CreateTab("核心控制", 4483362458)
    
    -- 1. 无限体力功能
    local InfiniteStaminaSection = MainTab:CreateSection("无限体力系统")
    local StaminaToggle = MainTab:CreateToggle({
        Name = "⚡ 无限体力模式",
        CurrentValue = false,
        Flag = "InfiniteStamina",
        Callback = function(Value)
            if Value then
                -- 无限体力逻辑
                local player = Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                
                while StaminaToggle.CurrentValue and character do
                    if character:FindFirstChild("Humanoid") then
                        character.Humanoid:SetAttribute("Stamina", 100)
                    end
                    task.wait(0.2)
                end
            end
        end
    })
    
    -- 2. 透视杀手和幸存者
    local VisionSection = MainTab:CreateSection("高级透视系统")
    local KillerVisionToggle = MainTab:CreateToggle({
        Name = "👁️ 透视杀手（红色高亮）",
        CurrentValue = false,
        Flag = "KillerVision",
        Callback = function(Value)
            -- 透视逻辑实现
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer and player.Character then
                    if Value then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.FillColor = Color3.fromRGB(255, 0, 0) -- 红色代表杀手
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    else
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
    
    local SurvivorVisionToggle = MainTab:CreateSection("透视幸存者（绿色高亮）")
    -- 类似实现幸存者透视逻辑
    
    -- 3. 攻击箱追踪
    local TrackingSection = MainTab:CreateSection("攻击箱追踪系统")
    local AttackBoxTracker = MainTab:CreateToggle({
        Name = "🎯 攻击箱实时追踪",
        CurrentValue = false,
        Flag = "AttackBoxTracker",
        Callback = function(Value)
            -- 攻击箱追踪逻辑
        end
    })
    
    Rayfield:LoadConfiguration()
    return true
end

-- 普通服务器标准UI功能
local function loadNormalServerUI()
    -- 这里放置您之前的标准UI代码
    -- 包括飞行、速度调整、透视等基础功能
    print("加载标准服务器UI")
    -- ... [您原有的标准UI代码] ...
end

-- 主执行函数
local function main()
    local serverType = getServerType()
    print("服务器类型检测结果: " .. serverType)
    
    if serverType == "ABANDONED" then
        loadAbandonedServerUI()
    else
        loadNormalServerUI()
    end
end

-- 安全启动
local success, err = pcall(main)
if not success then
    warn("UI加载错误: " .. err)
end

