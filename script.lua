-- 主窗口框架
local mainWindow = Window:create("脚本助手", 500, 700)

-- 创建选项卡控件
local tabControl = TabControl:create()
tabControl:setPosition(10, 10)
tabControl:setSize(480, 650)

-- 页面1: 公告页 (禁用状态)
local noticeTab = TabPage:create("公告")
local noticeLabel = Label:create("第1次做脚本\n不懂\n有什么位置不行叫我", 20, 50, 440, 150)
noticeLabel:setFontSize(16)
noticeLabel:setTextColor(0xCCCCCC)
noticeTab:addChild(noticeLabel)
noticeTab:setEnabled(false)  -- 禁用该页面 <x-preset class="no-tts reference-tag disable-to-doc" data-index="1">1</x-preset>

-- 页面2: 通用功能页
local generalTab = TabPage:create("通用")
local scrollPanel = ScrollPanel:create(0, 0, 460, 600)

-- 飞行功能
local flyBtn = Button:create("飞行", 20, 20, 100, 30)
local flySpeed = Slider:create("飞行速度:", 130, 25, 200, 25, 1, 100, 10)
scrollPanel:addChild(flyBtn)
scrollPanel:addChild(flySpeed)

-- 透视功能
local wallhackBtn = Checkbox:create("透视（彩色亮光穿透）", 20, 70)
scrollPanel:addChild(wallhackBtn)

-- 自瞄功能
local aimbotBtn = Checkbox:create("自瞄（视角跟随玩家）", 20, 110)
scrollPanel:addChild(aimbotBtn)

-- 传送功能
local teleportLabel = Label:create("传送玩家:", 20, 150)
local playerList = Listbox:create(20, 180, 300, 150)
playerList:addItem("玩家A")
playerList:addItem("玩家B")
local teleportBtn = Button:create("立即传送", 330, 180, 100, 30)
scrollPanel:addChild(teleportLabel)
scrollPanel:addChild(playerList)
scrollPanel:addChild(teleportBtn)

-- 旋转功能
local rotateBtn = Button:create("旋转", 20, 350, 100, 30)
local rotateSpeed = Slider:create("旋转速度:", 130, 355, 200, 25, 1, 9000, 1000)
scrollPanel:addChild(rotateBtn)
scrollPanel:addChild(rotateSpeed)

-- 移动速度
local speedToggle = Checkbox:create("开启移动速度", 20, 400)
local speedSlider = Slider:create("移动速度:", 20, 440, 300, 25, 1, 9999999999999, 100)
speedSlider:setEnabled(false)  -- 默认禁用
scrollPanel:addChild(speedToggle)
scrollPanel:addChild(speedSlider)

-- 跳跃高度
local jumpToggle = Checkbox:create("开启跳跃高度", 20, 490)
local jumpSlider = Slider:create("跳跃高度:", 20, 530, 300, 25, 1, 999, 100)
jumpSlider:setEnabled(false)  -- 默认禁用
scrollPanel:addChild(jumpToggle)
scrollPanel:addChild(jumpSlider)

-- 退出服务器
local quitBtn = Button:create("退出服务器", 20, 580, 150, 40)
quitBtn:setBackgroundColor(0xFF5555)
scrollPanel:addChild(quitBtn)

-- 页面3: 被遗弃功能页
local abandonedTab = TabPage:create("被遗弃")
local scrollPanel2 = ScrollPanel:create(0, 0, 460, 600)

-- 透视幸存者
local survivorBtn = Checkbox:create("透视幸存者", 20, 20)
scrollPanel2:addChild(survivorBtn)

-- 透视杀手
local killerBtn = Checkbox:create("透视杀手(包含脚印)", 20, 60)
scrollPanel2:addChild(killerBtn)

-- 攻击箱调整
local attackSlider = Slider:create("攻击箱调整(10-900):", 20, 100, 300, 25, 10, 900, 200)
scrollPanel2:addChild(attackSlider)

-- 攻击箱追踪
local trackBtn = Checkbox:create("攻击箱追踪玩家", 20, 140)
scrollPanel2:addChild(trackBtn)

-- 添加页面到选项卡
tabControl:addPage(noticeTab)
tabControl:addPage(generalTab)
tabControl:addPage(abandonedTab)
mainWindow:addChild(tabControl)

-- 功能实现逻辑 -----------------------------------
-- 飞行功能
function flyBtn:onClick()
    local speed = flySpeed:getValue()
    Game.setFlySpeed(speed)
    print("飞行已启用，速度："..speed)
end

-- 传送功能
function teleportBtn:onClick()
    local selected = playerList:getSelectedItem()
    if selected then
        Game.teleportToPlayer(selected:getText())
        print("已传送到玩家："..selected:getText())
    end
end

-- 退出服务器
function quitBtn:onClick()
    Network.quitServer()
    print("帮你退出服务器了，要感谢我😍😍😍")
end

-- 移动速度开关
function speedToggle:onStateChange(checked)
    speedSlider:setEnabled(checked)
end

-- 跳跃高度开关
function jumpToggle:onStateChange(checked)
    jumpSlider:setEnabled(checked)
end

-- 显示窗口
mainWindow:show()
