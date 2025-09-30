-- ========================
-- 主应用框架
-- ========================
local mainWindow = Window:create("多功能脚本助手", 500, 700)
mainWindow:setBackgroundColor(0x1E1E2E)  -- 深色主题背景

-- 创建选项卡控件
local tabControl = TabControl:create()
tabControl:setPosition(10, 10)
tabControl:setSize(480, 650)
tabControl:setTabHeight(30)

-- ========================
-- 页面1: 公告页 (禁用状态)
-- ========================
local noticeTab = TabPage:create("📢 公告")
local noticePanel = Panel:create(10, 10, 460, 600)
noticePanel:setBackgroundColor(0x252526)

local noticeLabel = Label:create(
    "⚠️ 重要提示  ⚠️\n\n"..
    "第1次做脚本\n"..
    "不懂\n"..
    "有什么位置不行叫我\n\n"..
    "此页面仅供查看，功能不可用",
    20, 50, 420, 200
)
noticeLabel:setFontSize(16)
noticeLabel:setTextColor(0xFFD700)  -- 金色文字

noticeTab:addChild(noticePanel)
noticePanel:addChild(noticeLabel)
noticeTab:setEnabled(false)  -- 禁用该页面<x-preset class="no-tts reference-tag disable-to-doc" data-index="3">3</x-preset>

-- ========================
-- 页面2: 通用功能页
-- ========================
local generalTab = TabPage:create("🔧 通用")
local scrollPanel = ScrollPanel:create(0, 0, 460, 600)

-- 飞行控制组
local flyGroup = GroupBox:create("飞行控制", 10, 10, 440, 80)
local flyBtn = Button:create("✈️ 飞行", 20, 30, 100, 30)
local flySpeed = Slider:create("飞行速度:", 130, 35, 250, 25, 1, 100, 10)
flySpeed:setValue(20)  -- 默认值
flyGroup:addChild(flyBtn)
flyGroup:addChild(flySpeed)

-- 透视功能
local wallhackBtn = Checkbox:create("👁️ 透视（玩家彩色亮光隔墙可见）", 20, 100)

-- 自瞄功能
local aimbotBtn = Checkbox:create("🎯 自瞄（视角跟随玩家）", 20, 140)

-- 传送功能
local teleportGroup = GroupBox:create("玩家传送", 10, 180, 440, 200)
local teleportLabel = Label:create("选择玩家:", 20, 30)
local playerList = Listbox:create(20, 60, 300, 100)
playerList:addItem("玩家A")
playerList:addItem("玩家B")
playerList:addItem("玩家C")
local teleportBtn = Button:create("🚀 立即传送", 330, 60, 100, 30)
teleportGroup:addChild(teleportLabel)
teleportGroup:addChild(playerList)
teleportGroup:addChild(teleportBtn)

-- 旋转控制组
local rotateGroup = GroupBox:create("旋转控制", 10, 390, 440, 80)
local rotateBtn = Button:create("🔄 旋转", 20, 30, 100, 30)
local rotateSpeed = Slider:create("旋转速度:", 130, 35, 250, 25, 1, 9000, 1500)
rotateSpeed:setValue(1500)  -- 默认值
rotateGroup:addChild(rotateBtn)
rotateGroup:addChild(rotateSpeed)

-- 角色移动控制
local movementGroup = GroupBox:create("角色移动", 10, 480, 440, 160)
local speedToggle = Checkbox:create("开启移动速度", 20, 30)
local speedSlider = Slider:create("移动速度:", 20, 60, 300, 25, 1, 9999999999999, 100)
speedSlider:setEnabled(false)

local jumpToggle = Checkbox:create("开启跳跃高度", 20, 100)
local jumpSlider = Slider:create("跳跃高度:", 20, 130, 300, 25, 1, 999, 100)
jumpSlider:setEnabled(false)

movementGroup:addChild(speedToggle)
movementGroup:addChild(speedSlider)
movementGroup:addChild(jumpToggle)
movementGroup:addChild(jumpSlider)

-- 退出服务器
local quitBtn = Button:create("退出服务器", 20, 650, 150, 40)
quitBtn:setBackgroundColor(0xFF5555)

-- 添加通用页组件
scrollPanel:addChild(flyGroup)
scrollPanel:addChild(wallhackBtn)
scrollPanel:addChild(aimbotBtn)
scrollPanel:addChild(teleportGroup)
scrollPanel:addChild(rotateGroup)
scrollPanel:addChild(movementGroup)
scrollPanel:addChild(quitBtn)
generalTab:addChild(scrollPanel)

-- ========================
-- 页面3: 被遗弃功能页
-- ========================
local abandonedTab = TabPage:create("🚫 被遗弃")
local scrollPanel2 = ScrollPanel:create(0, 0, 460, 600)

-- 透视功能组
local visionGroup = GroupBox:create("透视功能", 10, 10, 440, 120)
local survivorBtn = Checkbox:create("👤 透视幸存者", 20, 30)
local killerBtn = Checkbox:create("🔪 透视杀手(包含脚印)", 20, 70)
visionGroup:addChild(survivorBtn)
visionGroup:addChild(killerBtn)

-- 攻击箱控制组
local attackGroup = GroupBox:create("攻击箱控制", 10, 140, 440, 150)
local attackSlider = Slider:create("攻击箱调整(10-900):", 20, 30, 300, 25, 10, 900, 200)
local trackBtn = Checkbox:create("🎯 攻击箱追踪玩家", 20, 80)
attackGroup:addChild(attackSlider)
attackGroup:addChild(trackBtn)

-- 添加被遗弃页组件
scrollPanel2:addChild(visionGroup)
scrollPanel2:addChild(attackGroup)
abandonedTab:addChild(scrollPanel2)

-- ========================
-- 添加页面到选项卡
-- ========================
tabControl:addPage(noticeTab)
tabControl:addPage(generalTab)
tabControl:addPage(abandonedTab)
mainWindow:addChild(tabControl)

-- ========================
-- 功能实现核心逻辑
-- ========================

-- 飞行功能实现
function flyBtn:onClick()
    local speed = flySpeed:getValue()
    if Game.enableFlying(speed) then
        print("🛫 飞行已启用 | 速度: "..speed)
    else
        print("❌ 飞行功能初始化失败")
    end
end

-- 传送功能实现
function teleportBtn:onClick()
    local selected = playerList:getSelectedItem()
    if selected then
        local playerName = selected:getText()
        if Game.teleportToPlayer(playerName) then
            print("✨ 已传送到玩家: "..playerName)
        else
            print("❌ 无法定位玩家: "..playerName)
        end
    else
        print("⚠️ 请先选择要传送的玩家")
    end
end

-- 退出服务器实现
function quitBtn:onClick()
    if Network.disconnect() then
        print("👋 帮你退出服务器了，要感谢我😍😍😍")
    else
        print("❌ 退出服务器请求失败")
    end
end

-- 移动速度开关联动
function speedToggle:onStateChange(checked)
    speedSlider:setEnabled(checked)
    if checked then
        Game.setMoveSpeed(speedSlider:getValue())
    else
        Game.resetMoveSpeed()
    end
end

-- 跳跃高度开关联动
function jumpToggle:onStateChange(checked)
    jumpSlider:setEnabled(checked)
    if checked then
        Game.setJumpHeight(jumpSlider:getValue())
    else
        Game.resetJumpHeight()
    end
end

-- 旋转功能实现
function rotateBtn:onClick()
    local speed = rotateSpeed:getValue()
    Game.startRotation(speed)
    print("🌀 旋转中 | 速度: "..speed)
end

-- 攻击箱调整
function attackSlider:onValueChange(value)
    Game.setAttackBoxSize(value)
end

-- ========================
-- 显示主窗口
-- ========================
mainWindow:show()
print("✅ 脚本UI已成功加载")
