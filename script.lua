-- 罗布乐思脚本UI源码 - 小风专属版
-- 完全公益，请勿倒卖
-- UI作者：小风 | 快手账号：小车 | 快手号：QQ3867888

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("小风脚本 - 完全公益版", "DarkTheme")

-- ===== 公告页面 =====
local AnnouncementTab = Window:NewTab("公告")
local AnnouncementSection = AnnouncementTab:NewSection("公告信息")

-- 公告内容
AnnouncementSection:NewLabel("完全公益，请勿倒卖")
AnnouncementSection:NewLabel("UI作者：小风")
AnnouncementSection:NewLabel("快手账号：小车")
AnnouncementSection:NewLabel("快手号：QQ3867888")
AnnouncementSection:NewLabel("感谢使用!")

-- 不可用按钮
AnnouncementSection:NewButton("不可用按钮", "此按钮不可用", function()
    -- 空函数，按钮不可用
end)

AnnouncementSection:NewToggle("不可用切换", "此切换不可用", function(state)
    -- 空函数，切换不可用
end)

-- ===== 通用脚本页面 =====
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
                -- 禁用重力并重置速度
                humanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                humanoidRootPart.Gravity = 0
                
                -- 飞行控制连接
                if flyConnection then flyConnection:Disconnect() end
                flyConnection = game:GetService("RunService").Heartbeat:Connect(function()
                    if flying and humanoidRootPart then
                        local cam = workspace.CurrentCamera
                        local moveDir = Vector3.new()
                        
                        -- WASD控制方向
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
                        -- 空格上升，Shift下降
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
        -- 关闭飞行
        if flyConnection then
            flyConnection:Disconnect()
            flyConnection = nil
        end
        -- 恢复重力
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
GeneralSection:NewSlider("飞行速度", "调整飞行速度", 500, 1, function(speed)
    flySpeed = speed
end)

-- 自定义移速
GeneralSection:NewSlider("移动速度", "调整移动速度", 100, 16, function(speed)
    local player = game.Players.LocalPlayer
    if player.Character then
        local humanoid = player.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = speed
        end
    end
end)

-- 甩飞所有人
GeneralSection:NewButton("甩飞所有人", "甩飞所有玩家", function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character then
            local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart then
                -- 随机方向甩飞
                humanoidRootPart.Velocity = Vector3.new(
                    math.random(-200, 200),
                    math.random(150, 300),
                    math.random(-200, 200)
                )
            end
        end
    end
end)

-- 透视功能
local espEnabled = false
local espObjects = {}

GeneralSection:NewToggle("透视", "启用/禁用透视", function(state)
    espEnabled = state
    if espEnabled then
        -- 为所有玩家添加高亮
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = player.Character
                highlight.FillColor = Color3.fromRGB(0, 255, 0) -- 绿色
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                
                table.insert(espObjects, highlight)
            end
        end
    else
        -- 移除所有高亮
        for _, obj in pairs(espObjects) do
            if obj then
                obj:Remove()
            end
        end
        espObjects = {}
    end
end)

-- 自瞄功能
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
            
            -- 寻找最近的玩家
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
            
            -- 瞄准最近玩家
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
    -- 人物身上冒火效果
    local player = game.Players.LocalPlayer
    if player.Character then
        local fire = Instance.new("Fire")
        fire.Size = 15
        fire.Heat = 25
        fire.Parent = player.Character.Head
        
        local fire2 = Instance.new("Fire")
        fire2.Size = 20
        fire2.Heat = 30
        fire2.Parent = player.Character.HumanoidRootPart
    end
    
    -- 屏幕上方显示文字
    local gui = Instance.new("ScreenGui")
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 0.1, 0)
    text.Position = UDim2.new(0, 0, 0.1, 0)
    text.Text = "退吧，这服务器坏了"
    text.TextScaled = true
    text.TextColor3 = Color3.new(1, 0, 0)
    text.BackgroundTransparency = 1
    text.Font = Enum.Font.GothamBlack
    text.TextStrokeTransparency = 0
    text.TextStrokeColor3 = Color3.new(0, 0, 0)
    text.Parent = gui
end)

-- ===== 被遗弃页面 =====
local AbandonedTab = Window:NewTab("被遗弃")
local AbandonedSection = AbandonedTab:NewSection("被遗弃功能")

-- 访客1337自动防御
AbandonedSection:NewToggle("访客1337自动防御", "启用/禁用自动防御", function(state)
    -- 自动防御逻辑可以在这里实现
    if state then
        -- 启用自动防御
    else
        -- 禁用自动防御
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
                    -- 保持奔跑状态
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
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
                    -- 模拟维修动作
                    local args = {
                        [1] = obj,
                        [2] = "Repair"
                    }
                    
                    -- 尝试调用维修事件
                    local events = game:GetService("ReplicatedStorage"):GetChildren()
                    for _, event in ipairs(events) do
                        if event:IsA("RemoteEvent") then
                            event:FireServer(unpack(args))
                            break
                        end
                    end
                    
                    wait(3) -- 每三秒修一次
                end
            end
        end)
    elseif repairConnection then
        repairConnection:Disconnect()
        repairConnection = nil
    end
end)

-- 传送到杀手那边
AbandonedSection:NewButton("传送到杀手那边", "传送到杀手位置", function()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local killerRoot = player.Character:FindFirstChild("HumanoidRootPart")
            if killerRoot then
                local localChar = game.Players.LocalPlayer.Character
                if localChar then
                    local localRoot = localChar:FindFirstChild("HumanoidRootPart")
                    if localRoot then
                        localRoot.CFrame = killerRoot.CFrame * CFrame.new(0, 0, 5)
                        break
                    end
                end
            end
        end
    end
end)

-- 透视所有幸存者+杀手
local abandonedESP = false
local abandonedESPObjects = {}

AbandonedSection:NewToggle("透视所有玩家", "幸存者绿色,杀手红色", function(state)
    abandonedESP = state
    if not abandonedESP then
        -- 清除所有高亮
        for _, obj in pairs(abandonedESPObjects) do
            if obj then
                obj:Remove()
            end
        end
        abandonedESPObjects = {}
        return
    end
    
    -- 为所有玩家添加高亮和名字显示
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character then
            -- 创建高亮效果
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            
            -- 创建名字显示
            local billboard = Instance.new("BillboardGui")
            billboard.Parent = player.Character.Head
            billboard.Size = UDim2.new(0, 100, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            
            local text = Instance.new("TextLabel")
            text.Parent = billboard
            text.Size = UDim2.new(1, 0, 1, 0)
            text.Text = player.Name
            text.TextScaled = true
            text.BackgroundTransparency = 1
            text.Font = Enum.Font.GothamBold
            
            -- 根据角色类型设置颜色
            if player.Name:lower():find("killer") or player.Team and player.Team.Name:lower():find("killer") then
                highlight.FillColor = Color3.new(1, 0, 0) -- 红色：杀手
                text.TextColor3 = Color3.new(1, 0, 0)
            else
                highlight.FillColor = Color3.new(0, 1, 0) -- 绿色：幸存者
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

-- ===== 摧毁服务器页面（仅自己可见） =====
local DestroyTab = Window:NewTab("摧毁脚本")
local DestroySection = DestroyTab:NewSection("摧毁功能（仅自己可见）")

-- 摧毁1按钮
DestroySection:NewButton("摧毁1", "人物冒火,显示退出文字", function()
    -- 人物身上冒火
    local player = game.Players.LocalPlayer
    if player.Character then
        local fire = Instance.new("Fire")
        fire.Size = 12
        fire.Heat = 20
        fire.Parent = player.Character.Head
        
        local fire2 = Instance.new("Fire")
        fire2.Size = 18
        fire2.Heat = 25
        fire2.Parent = player.Character.HumanoidRootPart
    end
    
    -- 屏幕上方显示"退出？？？"红色字
    local gui = Instance.new("ScreenGui")
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 0.1, 0)
    text.Position = UDim2.new(0, 0, 0.2, 0)
    text.Text = "退出？？？"
    text.TextScaled = true
    text.TextColor3 = Color3.new(1, 0, 0)
    text.BackgroundTransparency = 1
    text.Font = Enum.Font.GothamBlack
    text.TextStrokeTransparency = 0
    text.TextStrokeColor3 = Color3.new(0, 0, 0)
    text.Parent = gui
end)

-- 摧毁2按钮
DestroySection:NewButton("摧毁2", "环境变黑,人物变黑,闪乱码,踢出", function()
    -- 环境变成黑色
    local lighting = game:GetService("Lighting")
    lighting.Ambient = Color3.new(0, 0, 0)
    lighting.OutdoorAmbient = Color3.new(0, 0, 0)
    lighting.Brightness = 0
    lighting.GlobalShadows = true
    
    -- 人物变成黑色
    local player = game.Players.LocalPlayer
    if player.Character then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("Part") then
                part.BrickColor = BrickColor.new("Really black")
                part.Material = Enum.Material.Slate
            end
        end
    end
    
    -- 屏幕上闪着乱码
    local gui = Instance.new("ScreenGui")
    gui.Parent = game.Players.LocalPlayer.PlayerGui
    
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, 0, 1, 0)
    text.Position = UDim2.new(0, 0, 0, 0)
    text.Text = "68khdwhjjszmsabvjazvddsxxwzwzwjo"
    text.TextScaled = true
    text.TextColor3 = Color3.new(1, 0, 0)
    text.BackgroundColor3 = Color3.new(0, 0, 0)
    text.Font = Enum.Font.GothamBlack
    text.Parent = gui
    
    -- 闪烁效果
    local blinkConnection
    blinkConnection = game:GetService("RunService").Heartbeat:Connect(function()
        text.Visible = not text.Visible
    end)
    
    -- 等待3秒后踢出玩家
    wait(3)
    if blinkConnection then
        blinkConnection:Disconnect()
    end
    -- 踢出玩家并显示错误信息
    player:Kick("错误代码267: ？你摧毁服务器干啥兄弟")
end)

-- 初始化脚本
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    -- 角色重生时重置状态
    if flying and flyConnection then
        flyConnection:Disconnect()
        flying = false
    end
end)

print("小风脚本加载成功！感谢使用！")

