--[[
喏脚本 UI
功能：
  1. 公告
  2. 通用（飞行、调整速度、甩飞、透视、跳跃、撸）
  3. 被遗弃（无限体力、夜视、透视、访客防御、攻击箱）
支持：窗口拖动、最小化、隐藏
作者：Copilot
]]

-- UI库示例（如需适配其他库，请替换UI部分）
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 主窗口
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "NoScriptUI"

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 400, 0, 350)
MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Name = "MainFrame"

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundTransparency = 1
Title.Text = "喏脚本"
Title.TextColor3 = Color3.fromRGB(255, 212, 90)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 26

-- 最小化与隐藏按钮
local MinBtn = Instance.new("TextButton", MainFrame)
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -60, 0, 0)
MinBtn.Text = "_"
MinBtn.TextSize = 24

local HideBtn = Instance.new("TextButton", MainFrame)
HideBtn.Size = UDim2.new(0, 30, 0, 30)
HideBtn.Position = UDim2.new(1, -30, 0, 0)
HideBtn.Text = "×"
HideBtn.TextSize = 24

-- 页面切换
local TabFrame = Instance.new("Frame", MainFrame)
TabFrame.Size = UDim2.new(0, 100, 0, 320)
TabFrame.Position = UDim2.new(0, 0, 0, 30)
TabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local function makeTab(name, order)
    local btn = Instance.new("TextButton", TabFrame)
    btn.Size = UDim2.new(1, 0, 0, 40)
    btn.Position = UDim2.new(0, 0, 0, (order-1)*40)
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(180,180,180)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 20
    return btn
end
local tab1 = makeTab("公告", 1)
local tab2 = makeTab("通用", 2)
local tab3 = makeTab("被遗弃", 3)

-- 主内容区域
local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Size = UDim2.new(0, 300, 0, 320)
ContentFrame.Position = UDim2.new(0, 100, 0, 30)
ContentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

-- 公告页面
local NoticePage = Instance.new("Frame", ContentFrame)
NoticePage.Size = UDim2.new(1, 0, 1, 0)
NoticePage.BackgroundTransparency = 1
NoticePage.Visible = true

local NoticeText = Instance.new("TextLabel", NoticePage)
NoticeText.Size = UDim2.new(1, -20, 0, 60)
NoticeText.Position = UDim2.new(0, 10, 0, 40)
NoticeText.Text = "做脚本19个月随便问\nui:444442555848"
NoticeText.TextColor3 = Color3.fromRGB(255,255,180)
NoticeText.Font = Enum.Font.Gotham
NoticeText.TextSize = 18
NoticeText.TextWrapped = true

-- 通用页面
local CommonPage = Instance.new("Frame", ContentFrame)
CommonPage.Size = UDim2.new(1, 0, 1, 0)
CommonPage.BackgroundTransparency = 1
CommonPage.Visible = false

local function makeLabel(parent, text, pos)
    local l = Instance.new("TextLabel", parent)
    l.Size = UDim2.new(1, -20, 0, 22)
    l.Position = UDim2.new(0, 10, 0, pos)
    l.Text = text
    l.Font = Enum.Font.Gotham
    l.TextColor3 = Color3.fromRGB(200,200,200)
    l.TextSize = 16
    l.BackgroundTransparency = 1
    l.TextXAlignment = Enum.TextXAlignment.Left
    return l
end

local flyLabel = makeLabel(CommonPage, "飞行", 10)
local flyToggle = Instance.new("TextButton", CommonPage)
flyToggle.Size = UDim2.new(0, 80, 0, 24)
flyToggle.Position = UDim2.new(0, 200, 0, 10)
flyToggle.Text = "开/关"

local speedLabel = makeLabel(CommonPage, "调整飞行速度", 40)
local speedBox = Instance.new("TextBox", CommonPage)
speedBox.Size = UDim2.new(0, 80, 0, 24)
speedBox.Position = UDim2.new(0, 200, 0, 40)
speedBox.Text = "17"

local allflyBtn = Instance.new("TextButton", CommonPage)
allflyBtn.Size = UDim2.new(1, -20, 0, 24)
allflyBtn.Position = UDim2.new(0, 10, 0, 70)
allflyBtn.Text = "甩飞所有玩家"

local seeAllBtn = Instance.new("TextButton", CommonPage)
seeAllBtn.Size = UDim2.new(1, -20, 0, 24)
seeAllBtn.Position = UDim2.new(0, 10, 0, 100)
seeAllBtn.Text = "透视所有玩家"

local jumpLabel = makeLabel(CommonPage, "设置跳跃高度", 130)
local jumpBox = Instance.new("TextBox", CommonPage)
jumpBox.Size = UDim2.new(0, 80, 0, 24)
jumpBox.Position = UDim2.new(0, 200, 0, 130)
jumpBox.Text = "50"

local luBtn = Instance.new("TextButton", CommonPage)
luBtn.Size = UDim2.new(1, -20, 0, 24)
luBtn.Position = UDim2.new(0, 10, 0, 160)
luBtn.Text = "撸"

-- 被遗弃页面
local AbandonPage = Instance.new("Frame", ContentFrame)
AbandonPage.Size = UDim2.new(1, 0, 1, 0)
AbandonPage.BackgroundTransparency = 1
AbandonPage.Visible = false

local stLabel = makeLabel(AbandonPage, "无限体力", 10)
local stBtn = Instance.new("TextButton", AbandonPage)
stBtn.Size = UDim2.new(0, 80, 0, 24)
stBtn.Position = UDim2.new(0, 200, 0, 10)
stBtn.Text = "开/关"

local nvLabel = makeLabel(AbandonPage, "夜视", 40)
local nvBtn = Instance.new("TextButton", AbandonPage)
nvBtn.Size = UDim2.new(0, 80, 0, 24)
nvBtn.Position = UDim2.new(0, 200, 0, 40)
nvBtn.Text = "开/关"

local seeSurBtn = Instance.new("TextButton", AbandonPage)
seeSurBtn.Size = UDim2.new(1, -20, 0, 24)
seeSurBtn.Position = UDim2.new(0, 10, 0, 70)
seeSurBtn.Text = "透视幸存者"

local seeKillBtn = Instance.new("TextButton", AbandonPage)
seeKillBtn.Size = UDim2.new(1, -20, 0, 24)
seeKillBtn.Position = UDim2.new(0, 10, 0, 100)
seeKillBtn.Text = "透视杀手"

local visitorBtn = Instance.new("TextButton", AbandonPage)
visitorBtn.Size = UDim2.new(1, -20, 0, 24)
visitorBtn.Position = UDim2.new(0, 10, 0, 130)
visitorBtn.Text = "访客1337自动防御"

local atkLabel = makeLabel(AbandonPage, "攻击箱调整", 160)
local atkBox = Instance.new("TextBox", AbandonPage)
atkBox.Size = UDim2.new(0, 80, 0, 24)
atkBox.Position = UDim2.new(0, 200, 0, 160)
atkBox.Text = "0"

local atkTrackBtn = Instance.new("TextButton", AbandonPage)
atkTrackBtn.Size = UDim2.new(1, -20, 0, 24)
atkTrackBtn.Position = UDim2.new(0, 10, 0, 190)
atkTrackBtn.Text = "攻击箱跟踪"

-- 页面切换逻辑
tab1.MouseButton1Click:Connect(function()
    NoticePage.Visible = true
    CommonPage.Visible = false
    AbandonPage.Visible = false
end)
tab2.MouseButton1Click:Connect(function()
    NoticePage.Visible = false
    CommonPage.Visible = true
    AbandonPage.Visible = false
end)
tab3.MouseButton1Click:Connect(function()
    NoticePage.Visible = false
    CommonPage.Visible = false
    AbandonPage.Visible = true
end)

-- 最小化/隐藏逻辑
MinBtn.MouseButton1Click:Connect(function()
    ContentFrame.Visible = not ContentFrame.Visible
end)
HideBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- 全局快捷键（F4显示/隐藏UI）
UIS.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.F4 then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

-- 功能实现（仅示例，具体逻辑需结合实际游戏API）
flyToggle.MouseButton1Click:Connect(function()
    -- 切换飞行
    print("飞行开关，速度：" .. tonumber(speedBox.Text) or 17)
end)
allflyBtn.MouseButton1Click:Connect(function()
    -- 甩飞所有玩家
    print("甩飞所有玩家")
end)
seeAllBtn.MouseButton1Click:Connect(function()
    -- 透视所有玩家
    print("透视所有玩家")
end)
jumpBox.FocusLost:Connect(function()
    print("设置跳跃高度："..tonumber(jumpBox.Text) or 50)
end)
luBtn.MouseButton1Click:Connect(function()
    -- 踢出服务器
    game:GetService("Players").LocalPlayer:Kick("SZ😂")
end)

stBtn.MouseButton1Click:Connect(function()
    print("无限体力 开关")
end)
nvBtn.MouseButton1Click:Connect(function()
    print("夜视 开关")
end)
seeSurBtn.MouseButton1Click:Connect(function()
    print("透视幸存者")
end)
seeKillBtn.MouseButton1Click:Connect(function()
    print("透视杀手")
end)
visitorBtn.MouseButton1Click:Connect(function()
    print("访客1337自动防御")
end)
atkBox.FocusLost:Connect(function()
    print("攻击箱调整："..tonumber(atkBox.Text) or 0)
end)
atkTrackBtn.MouseButton1Click:Connect(function()
    print("攻击箱跟踪")
end)

-- 结束
print("喏脚本UI已加载！F4显示/隐藏")
