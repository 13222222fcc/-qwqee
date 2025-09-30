local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()
local UIS = game:GetService("UserInputService")

-- 主UI框架
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NuoScript"
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 350, 0, 400)
MainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- 标题栏
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0.7, 0, 1, 0)
Title.Position = UDim2.new(0.15, 0, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "喏脚本 [444442555848]"
Title.TextColor3 = Color3.fromRGB(0, 200, 255)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = TitleBar

-- 控制按钮
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Name = "MinimizeButton"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -60, 0, 0)
MinimizeButton.BackgroundTransparency = 1
MinimizeButton.Text = "_"
MinimizeButton.TextColor3 = Color3.fromRGB(200, 200, 200)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 24
MinimizeButton.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 18
CloseButton.Parent = TitleBar

-- 标签页框架
local TabFrame = Instance.new("Frame")
TabFrame.Name = "TabFrame"
TabFrame.Size = UDim2.new(1, -20, 0, 30)
TabFrame.Position = UDim2.new(0, 10, 0, 40)
TabFrame.BackgroundTransparency = 1
TabFrame.Parent = MainFrame

-- 创建标签页按钮
local AnnouncementTab = Instance.new("TextButton")
AnnouncementTab.Name = "AnnouncementTab"
AnnouncementTab.Size = UDim2.new(0.3, 0, 1, 0)
AnnouncementTab.Position = UDim2.new(0, 0, 0, 0)
AnnouncementTab.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
AnnouncementTab.BorderSizePixel = 0
AnnouncementTab.Text = "公告"
AnnouncementTab.TextColor3 = Color3.fromRGB(255, 255, 255)
AnnouncementTab.Font = Enum.Font.SourceSans
AnnouncementTab.TextSize = 16
AnnouncementTab.Parent = TabFrame

local GeneralTab = Instance.new("TextButton")
GeneralTab.Name = "GeneralTab"
GeneralTab.Size = UDim2.new(0.3, 0, 1, 0)
GeneralTab.Position = UDim2.new(0.35, 0, 0, 0)
GeneralTab.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
GeneralTab.BorderSizePixel = 0
GeneralTab.Text = "通用"
GeneralTab.TextColor3 = Color3.fromRGB(200, 200, 200)
GeneralTab.Font = Enum.Font.SourceSans
GeneralTab.TextSize = 16
GeneralTab.Parent = TabFrame

local ForsakenTab = Instance.new("TextButton")
ForsakenTab.Name = "ForsakenTab"
ForsakenTab.Size = UDim2.new(0.3, 0, 1, 0)
ForsakenTab.Position = UDim2.new(0.7, 0, 0, 0)
ForsakenTab.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
ForsakenTab.BorderSizePixel = 0
ForsakenTab.Text = "被遗弃"
ForsakenTab.TextColor3 = Color3.fromRGB(200, 200, 200)
ForsakenTab.Font = Enum.Font.SourceSans
ForsakenTab.TextSize = 16
ForsakenTab.Parent = TabFrame

-- 内容框架
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -20, 1, -90)
ContentFrame.Position = UDim2.new(0, 10, 0, 80)
ContentFrame.BackgroundTransparency = 1
ContentFrame.ClipsDescendants = true
ContentFrame.Parent = MainFrame

-- 公告页面
local AnnouncementPage = Instance.new("ScrollingFrame")
AnnouncementPage.Name = "AnnouncementPage"
AnnouncementPage.Size = UDim2.new(1, 0, 1, 0)
AnnouncementPage.BackgroundTransparency = 1
AnnouncementPage.ScrollBarThickness = 5
AnnouncementPage.Visible = true
AnnouncementPage.Parent = ContentFrame

local AnnouncementText = Instance.new("TextLabel")
AnnouncementText.Name = "AnnouncementText"
AnnouncementText.Size = UDim2.new(1, -20, 0, 350)
AnnouncementText.Position = UDim2.new(0, 10, 0, 10)
AnnouncementText.BackgroundTransparency = 1
AnnouncementText.Text = "喏脚本公告\n\n做脚本19个月随便问\n\n版本: 444442555848\n\n功能持续更新中...\n有问题请反馈"
AnnouncementText.TextColor3 = Color3.fromRGB(200, 200, 255)
AnnouncementText.Font = Enum.Font.SourceSans
AnnouncementText.TextSize = 18
AnnouncementText.TextWrapped = true
AnnouncementText.TextXAlignment = Enum.TextXAlignment.Left
AnnouncementText.TextYAlignment = Enum.TextYAlignment.Top
AnnouncementText.Parent = AnnouncementPage

-- 通用页面
local GeneralPage = Instance.new("ScrollingFrame")
GeneralPage.Name = "GeneralPage"
GeneralPage.Size = UDim2.new(1, 0, 1, 0)
GeneralPage.BackgroundTransparency = 1
GeneralPage.ScrollBarThickness = 5
GeneralPage.Visible = false
GeneralPage.Parent = ContentFrame

-- 飞行功能
local FlyToggle = Instance.new("TextButton")
FlyToggle.Name = "FlyToggle"
FlyToggle.Size = UDim2.new(1, -20, 0, 30)
FlyToggle.Position = UDim2.new(0, 10, 0, 10)
FlyToggle.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
FlyToggle.BorderSizePixel = 0
FlyToggle.Text = "飞行 [关闭]"
FlyToggle.TextColor3 = Color3.fromRGB(255, 150, 150)
FlyToggle.Font = Enum.Font.SourceSans
FlyToggle.TextSize = 16
FlyToggle.Parent = GeneralPage

-- 飞行速度滑块
local FlySpeedLabel = Instance.new("TextLabel")
FlySpeedLabel.Name = "FlySpeedLabel"
FlySpeedLabel.Size = UDim2.new(1, -20, 0, 20)
FlySpeedLabel.Position = UDim2.new(0, 10, 0, 50)
FlySpeedLabel.BackgroundTransparency = 1
FlySpeedLabel.Text = "飞行速度: 50"
FlySpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
FlySpeedLabel.Font = Enum.Font.SourceSans
FlySpeedLabel.TextSize = 16
FlySpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
FlySpeedLabel.Parent = GeneralPage

local FlySpeedSlider = Instance.new("TextBox")
FlySpeedSlider.Name = "FlySpeedSlider"
FlySpeedSlider.Size = UDim2.new(1, -20, 0, 25)
FlySpeedSlider.Position = UDim2.new(0, 10, 0, 75)
FlySpeedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
FlySpeedSlider.BorderSizePixel = 0
FlySpeedSlider.Text = "50"
FlySpeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
FlySpeedSlider.Font = Enum.Font.SourceSans
FlySpeedSlider.TextSize = 16
FlySpeedSlider.Parent = GeneralPage

-- 移动速度滑块
local SpeedLabel = Instance.new("TextLabel")
SpeedLabel.Name = "SpeedLabel"
SpeedLabel.Size = UDim2.new(1, -20, 0, 20)
SpeedLabel.Position = UDim2.new(0, 10, 0, 110)
SpeedLabel.BackgroundTransparency = 1
SpeedLabel.Text = "移动速度: 17"
SpeedLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
SpeedLabel.Font = Enum.Font.SourceSans
SpeedLabel.TextSize = 16
SpeedLabel.TextXAlignment = Enum.TextXAlignment.Left
SpeedLabel.Parent = GeneralPage

local SpeedSlider = Instance.new("TextBox")
SpeedSlider.Name = "SpeedSlider"
SpeedSlider.Size = UDim2.new(1, -20, 0, 25)
SpeedSlider.Position = UDim2.new(0, 10, 0, 135)
SpeedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
SpeedSlider.BorderSizePixel = 0
SpeedSlider.Text = "17"
SpeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedSlider.Font = Enum.Font.SourceSans
SpeedSlider.TextSize = 16
SpeedSlider.Parent = GeneralPage

-- 其他功能按钮
local ThrowPlayers = Instance.new("TextButton")
ThrowPlayers.Name = "ThrowPlayers"
ThrowPlayers.Size = UDim2.new(1, -20, 0, 30)
ThrowPlayers.Position = UDim2.new(0, 10, 0, 170)
ThrowPlayers.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
ThrowPlayers.BorderSizePixel = 0
ThrowPlayers.Text = "甩飞所有玩家"
ThrowPlayers.TextColor3 = Color3.fromRGB(255, 150, 150)
ThrowPlayers.Font = Enum.Font.SourceSans
ThrowPlayers.TextSize = 16
ThrowPlayers.Parent = GeneralPage

local SeePlayers = Instance.new("TextButton")
SeePlayers.Name = "SeePlayers"
SeePlayers.Size = UDim2.new(1, -20, 0, 30)
SeePlayers.Position = UDim2.new(0, 10, 0, 210)
SeePlayers.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
ThrowPlayers.BorderSizePixel = 0
SeePlayers.Text = "透视所有玩家 [关闭]"
SeePlayers.TextColor3 = Color3.fromRGB(255, 150, 150)
SeePlayers.Font = Enum.Font.SourceSans
SeePlayers.TextSize = 16
SeePlayers.Parent = GeneralPage

-- 跳跃高度设置
local JumpHeightLabel = Instance.new("TextLabel")
JumpHeightLabel.Name = "JumpHeightLabel"
JumpHeightLabel.Size = UDim2.new(1, -20, 0, 20)
JumpHeightLabel.Position = UDim2.new(0, 10, 0, 250)
JumpHeightLabel.BackgroundTransparency = 1
JumpHeightLabel.Text = "跳跃高度: 50"
JumpHeightLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
JumpHeightLabel.Font = Enum.Font.SourceSans
JumpHeightLabel.TextSize = 16
JumpHeightLabel.TextXAlignment = Enum.TextXAlignment.Left
JumpHeightLabel.Parent = GeneralPage

local JumpHeightSlider = Instance.new("TextBox")
JumpHeightSlider.Name = "JumpHeightSlider"
JumpHeightSlider.Size = UDim2.new(1, -20, 0, 25)
JumpHeightSlider.Position = UDim2.new(0, 10, 0, 275)
JumpHeightSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
JumpHeightSlider.BorderSizePixel = 0
JumpHeightSlider.Text = "50"
JumpHeightSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpHeightSlider.Font = Enum.Font.SourceSans
JumpHeightSlider.TextSize = 16
JumpHeightSlider.Parent = GeneralPage

-- 撸按钮
local LuButton = Instance.new("TextButton")
LuButton.Name = "LuButton"
LuButton.Size = UDim2.new(1, -20, 0, 30)
LuButton.Position = UDim2.new(0, 10, 0, 310)
LuButton.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
LuButton.BorderSizePixel = 0
LuButton.Text = "撸"
LuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LuButton.Font = Enum.Font.SourceSansBold
LuButton.TextSize = 18
LuButton.Parent = GeneralPage

-- 被遗弃页面
local ForsakenPage = Instance.new("ScrollingFrame")
ForsakenPage.Name = "ForsakenPage"
ForsakenPage.Size = UDim2.new(1, 0, 1, 0)
ForsakenPage.BackgroundTransparency = 1
ForsakenPage.ScrollBarThickness = 5
ForsakenPage.Visible = false
ForsakenPage.Parent = ContentFrame

-- 被遗弃功能按钮
local functions = {
    "无限体力 [关闭]",
    "夜视 [关闭]",
    "透视幸存者 [关闭]",
    "透视杀手 [关闭]",
    "访客1337自动防御 [关闭]"
}

for i, funcName in ipairs(functions) do
    local button = Instance.new("TextButton")
    button.Name = funcName:gsub("%[.*%]", ""):gsub(" ", "")
    button.Size = UDim2.new(1, -20, 0, 30)
    button.Position = UDim2.new(0, 10, 0, 10 + (i-1)*40)
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
    button.BorderSizePixel = 0
    button.Text = funcName
    button.TextColor3 = Color3.fromRGB(255, 150, 150)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 16
    button.Parent = ForsakenPage
end

-- 攻击箱调整
local AttackBoxLabel = Instance.new("TextLabel")
AttackBoxLabel.Name = "AttackBoxLabel"
AttackBoxLabel.Size = UDim2.new(1, -20, 0, 20)
AttackBoxLabel.Position = UDim2.new(0, 10, 0, 210)
AttackBoxLabel.BackgroundTransparency = 1
AttackBoxLabel.Text = "攻击箱调整: 650"
AttackBoxLabel.TextColor3 = Color3.fromRGB(200, 200, 255)
AttackBoxLabel.Font = Enum.Font.SourceSans
AttackBoxLabel.TextSize = 16
AttackBoxLabel.TextXAlignment = Enum.TextXAlignment.Left
AttackBoxLabel.Parent = ForsakenPage

local AttackBoxSlider = Instance.new("TextBox")
AttackBoxSlider.Name = "AttackBoxSlider"
AttackBoxSlider.Size = UDim2.new(1, -20, 0, 25)
AttackBoxSlider.Position = UDim2.new(0, 10, 0, 235)
AttackBoxSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
AttackBoxSlider.BorderSizePixel = 0
AttackBoxSlider.Text = "650"
AttackBoxSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
AttackBoxSlider.Font = Enum.Font.SourceSans
AttackBoxSlider.TextSize = 16
AttackBoxSlider.Parent = ForsakenPage

-- 攻击箱跟踪
local AttackTrack = Instance.new("TextButton")
AttackTrack.Name = "AttackTrack"
AttackTrack.Size = UDim2.new(1, -20, 0, 30)
AttackTrack.Position = UDim2.new(0, 10, 0, 270)
AttackTrack.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
AttackTrack.BorderSizePixel = 0
AttackTrack.Text = "攻击箱跟踪 [关闭]"
AttackTrack.TextColor3 = Color3.fromRGB(255, 150, 150)
AttackTrack.Font = Enum.Font.SourceSans
AttackTrack.TextSize = 16
AttackTrack.Parent = ForsakenPage

-- 最小化状态图标
local MinimizedIcon = Instance.new("TextButton")
MinimizedIcon.Name = "MinimizedIcon"
MinimizedIcon.Size = UDim2.new(0, 40, 0,
