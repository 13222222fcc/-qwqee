--[[
喏脚本 UI
作者: Copilot
功能：
- 公告页（做脚本19个月随便问，ui:444442555848）
- 通用页（飞行、速度、甩飞、透视、跳高、撸）
- 被遗弃页（无限体力、夜视、透视、自动防御、攻击箱）
- 可拖动、隐藏、缩小化
]]

local UIS = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")
local Players = game:GetService("Players")

-----------------------------------
-- 窗口基础
-----------------------------------
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "喏脚本UI"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

local dragFrame = Instance.new("Frame")
dragFrame.Name = "MainFrame"
dragFrame.Size = UDim2.new(0, 380, 0, 340)
dragFrame.Position = UDim2.new(0.5, -190, 0.5, -170)
dragFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
dragFrame.BorderSizePixel = 0
dragFrame.Active = true
dragFrame.Draggable = true
dragFrame.Parent = screenGui

-- 标题栏
local titleBar = Instance.new("Frame", dragFrame)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
titleBar.Size = UDim2.new(1, 0, 0, 32)
titleBar.BorderSizePixel = 0

local title = Instance.new("TextLabel", titleBar)
title.Text = "喏脚本"
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 22
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, -60, 1, 0)
title.Position = UDim2.new(0, 10, 0, 0)

-- 缩小按钮
local minimize = Instance.new("TextButton", titleBar)
minimize.Text = "-"
minimize.Size = UDim2.new(0, 30, 1, 0)
minimize.Position = UDim2.new(1, -65, 0, 0)
minimize.BackgroundTransparency = 0.5
minimize.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
minimize.TextColor3 = Color3.new(1,1,1)
minimize.Font = Enum.Font.SourceSansBold
minimize.TextSize = 24

-- 隐藏按钮
local hide = Instance.new("TextButton", titleBar)
hide.Text = "×"
hide.Size = UDim2.new(0, 30, 1, 0)
hide.Position = UDim2.new(1, -35, 0, 0)
hide.BackgroundTransparency = 0.5
hide.BackgroundColor3 = Color3.new(0.5, 0, 0)
hide.TextColor3 = Color3.new(1,1,1)
hide.Font = Enum.Font.SourceSansBold
hide.TextSize = 24

-- 隐藏后显示的小按钮
local showBtn = Instance.new("TextButton", screenGui)
showBtn.Size = UDim2.new(0, 80, 0, 30)
showBtn.Position = UDim2.new(0, 20, 0.5, -15)
showBtn.Text = "喏脚本"
showBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
showBtn.TextColor3 = Color3.new(1,1,1)
showBtn.Visible = false

-- 页面tab
local tabs = {"公告", "通用", "被遗弃"}
local tabBtns = {}
for i, tab in ipairs(tabs) do
    local btn = Instance.new("TextButton", dragFrame)
    btn.Size = UDim2.new(0, 100, 0, 32)
    btn.Position = UDim2.new(0, (i-1)*105, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
    btn.Text = tab
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 20
    tabBtns[tab] = btn
end

-----------------------------------
-- 页面内容
-----------------------------------
-- 公告页面
local page_公告 = Instance.new("Frame", dragFrame)
page_公告.Size = UDim2.new(1, 0, 1, -80)
page_公告.Position = UDim2.new(0, 0, 0, 80)
page_公告.BackgroundTransparency = 1

local notice = Instance.new("TextLabel", page_公告)
notice.Size = UDim2.new(1, -40, 0, 80)
notice.Position = UDim2.new(0, 20, 0, 50)
notice.Text = "做脚本19个月随便问\nui:444442555848"
notice.Font = Enum.Font.SourceSansBold
notice.TextColor3 = Color3.fromRGB(255, 220, 80)
notice.TextSize = 26
notice.TextWrapped = true
notice.BackgroundTransparency = 1

-- 通用页面
local page_通用 = Instance.new("Frame", dragFrame)
page_通用.Size = UDim2.new(1, 0, 1, -80)
page_通用.Position = UDim2.new(0, 0, 0, 80)
page_通用.BackgroundTransparency = 1
page_通用.Visible = false

local function makeLabel(parent, text, y)
    local l = Instance.new("TextLabel", parent)
    l.Size = UDim2.new(1, -20, 0, 28)
    l.Position = UDim2.new(0, 10, 0, y)
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = Color3.new(1,1,1)
    l.Font = Enum.Font.SourceSans
    l.TextSize = 18
    l.TextXAlignment = Enum.TextXAlignment.Left
    return l
end

makeLabel(page_通用, "飞行", 0)
local flyToggle = Instance.new("TextButton", page_通用)
flyToggle.Size = UDim2.new(0, 80, 0, 28)
flyToggle.Position = UDim2.new(0, 120, 0, 0)
flyToggle.Text = "开/关"
flyToggle.BackgroundColor3 = Color3.fromRGB(65,65,80)
flyToggle.TextColor3 = Color3.new(1,1,1)
flyToggle.Font = Enum.Font.SourceSans
flyToggle.TextSize = 18

makeLabel(page_通用, "调整飞行速度", 40)
local flySpeed = Instance.new("TextBox", page_通用)
flySpeed.Size = UDim2.new(0, 100, 0, 24)
flySpeed.Position = UDim2.new(0, 140, 0, 40)
flySpeed.PlaceholderText = "17 ~ 100000"
flySpeed.Text = "100"
flySpeed.ClearTextOnFocus = false

makeLabel(page_通用, "甩飞所有玩家", 80)
local flingBtn = Instance.new("TextButton", page_通用)
flingBtn.Size = UDim2.new(0, 90, 0, 24)
flingBtn.Position = UDim2.new(0, 150, 0, 80)
flingBtn.Text = "甩飞"
flingBtn.BackgroundColor3 = Color3.fromRGB(65,65,80)
flingBtn.TextColor3 = Color3.new(1,1,1)
flingBtn.Font = Enum.Font.SourceSans
flingBtn.TextSize = 18

makeLabel(page_通用, "透视所有玩家", 120)
local espBtn = Instance.new("TextButton", page_通用)
espBtn.Size = UDim2.new(0, 90, 0, 24)
espBtn.Position = UDim2.new(0, 150, 0, 120)
espBtn.Text = "透视"
espBtn.BackgroundColor3 = Color3.fromRGB(65,65,80)
espBtn.TextColor3 = Color3.new(1,1,1)
espBtn.Font = Enum.Font.SourceSans
espBtn.TextSize = 18

makeLabel(page_通用, "设置跳跃高度", 160)
local jumpBox = Instance.new("TextBox", page_通用)
jumpBox.Size = UDim2.new(0, 100, 0, 24)
jumpBox.Position = UDim2.new(0, 140, 0, 160)
jumpBox.PlaceholderText = "0 ~ 100000"
jumpBox.Text = "50"
jumpBox.ClearTextOnFocus = false

makeLabel(page_通用, "撸", 200)
local luBtn = Instance.new("TextButton", page_通用)
luBtn.Size = UDim2.new(0, 60, 0, 24)
luBtn.Position = UDim2.new(0, 150, 0, 200)
luBtn.Text = "撸！"
luBtn.BackgroundColor3 = Color3.fromRGB(180,40,60)
luBtn.TextColor3 = Color3.new(1,1,1)
luBtn.Font = Enum.Font.SourceSans
luBtn.TextSize = 18

-- 被遗弃页面
local page_被遗弃 = Instance.new("Frame", dragFrame)
page_被遗弃.Size = UDim2.new(1, 0, 1, -80)
page_被遗弃.Position = UDim2.new(0, 0, 0, 80)
page_被遗弃.BackgroundTransparency = 1
page_被遗弃.Visible = false

makeLabel(page_被遗弃, "无限体力", 0)
local staminaBtn = Instance.new("TextButton", page_被遗弃)
staminaBtn.Size = UDim2.new(0, 80, 0, 24)
staminaBtn.Position = UDim2.new(0, 120, 0, 0)
staminaBtn.Text = "开/关"
staminaBtn.BackgroundColor3 = Color3.fromRGB(65,65,80)
staminaBtn.TextColor3 = Color3.new(1,1,1)
staminaBtn.Font = Enum.Font.SourceSans
staminaBtn.TextSize = 18

makeLabel(page_被遗弃, "夜视", 40)
local nightBtn = Instance.new("TextButton", page_被遗弃)
nightBtn.Size = UDim2.new(0, 80, 0, 24)
nightBtn.Position = UDim2.new(0, 120, 0, 40)
nightBtn.Text = "开/关"
nightBtn.BackgroundColor3 = Color3.fromRGB(65,65,80)
nightBtn.TextColor3 = Color3.new(1,1,1)
nightBtn.Font = Enum.Font.SourceSans
nightBtn.TextSize = 18

makeLabel(page_被遗弃, "透视幸存者", 80)
local survivorEsp = Instance.new("TextButton", page_被遗弃)
survivorEsp.Size = UDim2.new(0, 90, 0, 24)
survivorEsp.Position = UDim2.new(0, 150, 0, 80)
survivorEsp.Text = "透视"
survivorEsp.BackgroundColor3 = Color3.fromRGB(65,65,80)
survivorEsp.TextColor3 = Color3.new(1,1,1)
survivorEsp.Font = Enum.Font.SourceSans
survivorEsp.TextSize = 18

makeLabel(page_被遗弃, "透视杀手", 120)
local killerEsp = Instance.new("TextButton", page_被遗弃)
killerEsp.Size = UDim2.new(0, 90, 0, 24)
killerEsp.Position = UDim2.new(0, 150, 0, 120)
killerEsp.Text = "透视"
killerEsp.BackgroundColor3 = Color3.fromRGB(65,65,80)
killerEsp.TextColor3 = Color3.new(1,1,1)
killerEsp.Font = Enum.Font.SourceSans
killerEsp.TextSize = 18

makeLabel(page_被遗弃, "访客1337自动防御", 160)
local defendBtn = Instance.new("TextButton", page_被遗弃)
defendBtn.Size = UDim2.new(0, 120, 0, 24)
defendBtn.Position = UDim2.new(0, 170, 0, 160)
defendBtn.Text = "开启防御"
defendBtn.BackgroundColor3 = Color3.fromRGB(65,90,65)
defendBtn.TextColor3 = Color3.new(1,1,1)
defendBtn.Font = Enum.Font.SourceSans
defendBtn.TextSize = 18

makeLabel(page_被遗弃, "攻击箱调整", 200)
local boxSlider = Instance.new("TextBox", page_被遗弃)
boxSlider.Size = UDim2.new(0, 100, 0, 24)
boxSlider.Position = UDim2.new(0, 140, 0, 200)
boxSlider.PlaceholderText = "0 ~ 1300"
boxSlider.Text = "1000"
boxSlider.ClearTextOnFocus = false

makeLabel(page_被遗弃, "攻击箱跟踪", 240)
local boxTrack = Instance.new("TextButton", page_被遗弃)
boxTrack.Size = UDim2.new(0, 100, 0, 24)
boxTrack.Position = UDim2.new(0, 150, 0, 240)
boxTrack.Text = "跟踪"
boxTrack.BackgroundColor3 = Color3.fromRGB(65,65,80)
boxTrack.TextColor3 = Color3.new(1,1,1)
boxTrack.Font = Enum.Font.SourceSans
boxTrack.TextSize = 18

-----------------------------------
-- tab切换
-----------------------------------
local pages = {
    ["公告"] = page_公告,
    ["通用"] = page_通用,
    ["被遗弃"] = page_被遗弃,
}
for tab, btn in pairs(tabBtns) do
    btn.MouseButton1Click:Connect(function()
        for _, page in pairs(pages) do page.Visible = false end
        pages[tab].Visible = true
        for _, t in ipairs(tabBtns) do t.BackgroundColor3 = Color3.fromRGB(45,45,45) end
        btn.BackgroundColor3 = Color3.fromRGB(80,80,80)
    end)
end
tabBtns["公告"].BackgroundColor3 = Color3.fromRGB(80,80,80)

-----------------------------------
-- 隐藏与缩小
-----------------------------------
minimize.MouseButton1Click:Connect(function()
    dragFrame.Size = UDim2.new(0, 380, 0, 40)
    for _, page in pairs(pages) do page.Visible = false end
    for _, t in pairs(tabBtns) do t.Visible = false end
end)

titleBar.MouseButton2Click:Connect(function()
    dragFrame.Size = UDim2.new(0, 380, 0, 340)
    for _, t in pairs(tabBtns) do t.Visible = true end
    for _, page in pairs(pages) do page.Visible = false end
    local sel = nil
    for tab, btn in pairs(tabBtns) do
        if btn.BackgroundColor3 == Color3.fromRGB(80,80,80) then sel = tab end
    end
    if sel then pages[sel].Visible = true end
end)

hide.MouseButton1Click:Connect(function()
    dragFrame.Visible = false
    showBtn.Visible = true
end)
showBtn.MouseButton1Click:Connect(function()
    dragFrame.Visible = true
    showBtn.Visible = false
end)

-----------------------------------
-- 功能实现脚本（示例，需根据实际游戏API实现）
-----------------------------------

flyToggle.MouseButton1Click:Connect(function()
    -- 实现飞行开关
end)
flySpeed.FocusLost:Connect(function()
    -- 设置飞行速度
end)
flingBtn.MouseButton1Click:Connect(function()
    -- 甩飞所有玩家
end)
espBtn.MouseButton1Click:Connect(function()
    -- 透视所有玩家
end)
jumpBox.FocusLost:Connect(function()
    -- 设置跳跃高度
end)
luBtn.MouseButton1Click:Connect(function()
    -- 踢出服务器，提示SZ😂
    game.Players.LocalPlayer:Kick("SZ😂")
end)

staminaBtn.MouseButton1Click:Connect(function()
    -- 无限体力
end)
nightBtn.MouseButton1Click:Connect(function()
    -- 夜视
end)
survivorEsp.MouseButton1Click:Connect(function()
    -- 透视幸存者
end)
killerEsp.MouseButton1Click:Connect(function()
    -- 透视杀手
end)
defendBtn.MouseButton1Click:Connect(function()
    -- 访客1337自动防御
end)
boxSlider.FocusLost:Connect(function()
    -- 攻击箱调整
end)
boxTrack.MouseButton1Click:Connect(function()
    -- 攻击箱跟踪
end)

-----------------------------------
-- END
-----------------------------------
