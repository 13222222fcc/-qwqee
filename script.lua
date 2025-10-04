local love = require("love")

-- 弹窗类定义
local PopupWindow = {}
PopupWindow.__index = PopupWindow

-- 星星效果类
local Star = {}
Star.__index = Star

function Star.new(x, y)
    local self = setmetatable({}, Star)
    self.x = x
    self.y = y
    self.size = math.random(2, 5)
    self.speed = math.random(50, 100)
    self.alpha = 1.0
    self.clickEffect = false
    self.effectSize = 0
    self.effectAlpha = 1.0
    return self
end

function Star:update(dt)
    if not self.clickEffect then
        self.y = self.y - self.speed * dt
        if self.y < -10 then
            self.y = love.graphics.getHeight() + 10
            self.x = math.random(0, love.graphics.getWidth())
        end
    else
        self.effectSize = self.effectSize + 200 * dt
        self.effectAlpha = self.effectAlpha - 2 * dt
        if self.effectAlpha <= 0 then
            self.clickEffect = false
            self.effectSize = 0
            self.effectAlpha = 1.0
        end
    end
end

function Star:draw()
    if not self.clickEffect then
        love.graphics.setColor(1, 1, 1, self.alpha)
        love.graphics.circle("fill", self.x, self.y, self.size)
    else
        love.graphics.setColor(1, 1, 1, self.effectAlpha)
        love.graphics.circle("line", self.x, self.y, self.effectSize)
    end
end

function Star:contains(x, y)
    return not self.clickEffect and 
           math.sqrt((x - self.x)^2 + (y - self.y)^2) <= self.size
end

function PopupWindow.new()
    local self = setmetatable({}, PopupWindow)
    self.width = 400
    self.height = 300
    self.x = (love.graphics.getWidth() - self.width) / 2
    self.y = (love.graphics.getHeight() - self.height) / 2
    self.dragging = false
    self.dragOffsetX = 0
    self.dragOffsetY = 0
    self.visible = true
    self.scale = 1.0
    self.currentPage = "公告"
    
    -- 星星效果
    self.stars = {}
    self.starTimer = 0
    
    -- 页面数据
    self.pages = {
        ["公告"] = {
            title = "公告",
            content = "做脚本第1天\n有什么事请联系快手:dddj877hd"
        },
        ["通用"] = {
            title = "通用功能",
            items = {
                "飞行",
                "调整飞行速度",
                "开启速度调整", 
                "速度调整",
                "开启跳跃高度",
                "调整跳跃高度",
                "获得F3x工具",
                "点击传送工具",
                "隐身",
                "透视"
            }
        }
    }
    
    -- 初始化星星
    for i = 1, 15 do
        table.insert(self.stars, Star.new(
            math.random(0, self.width),
            math.random(0, self.height)
        ))
    end
    
    return self
end

function PopupWindow:update(dt)
    -- 更新星星
    self.starTimer = self.starTimer + dt
    if self.starTimer >= 3 then
        self.starTimer = 0
        for i = 1, 5 do
            table.insert(self.stars, Star.new(
                math.random(0, self.width),
                self.height + 10
            ))
        end
    end
    
    for i = #self.stars, 1, -1 do
        self.stars[i]:update(dt)
        if self.stars[i].y < -20 and not self.stars[i].clickEffect then
            table.remove(self.stars, i)
        end
    end
end

function PopupWindow:draw()
    if not self.visible then return end
    
    love.graphics.push()
    love.graphics.translate(self.x, self.y)
    love.graphics.scale(self.scale, self.scale)
    
    -- 绘制灰色背景
    love.graphics.setColor(0.3, 0.3, 0.3, 0.9)
    love.graphics.rectangle("fill", 0, 0, self.width, self.height)
    
    -- 绘制黑色边框线
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.setLineWidth(2)
    love.graphics.rectangle("line", 0, 0, self.width, self.height)
    
    -- 绘制左右黑色竖线（功能切换区域）
    local lineSpacing = 113 -- 约3厘米（假设屏幕DPI）
    for y = lineSpacing, self.height - lineSpacing, lineSpacing do
        love.graphics.line(0, y, 20, y)  -- 左边横线
        love.graphics.line(self.width - 20, y, self.width, y)  -- 右边横线
    end
    
    -- 绘制星星
    for _, star in ipairs(self.stars) do
        star:draw()
    end
    
    -- 绘制页面内容
    love.graphics.setColor(1, 1, 1, 1)
    
    -- 绘制标题栏
    love.graphics.rectangle("fill", 0, 0, self.width, 30)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print(self.pages[self.currentPage].title, 10, 8)
    
    -- 绘制控制按钮（最小化、关闭、隐藏）
    love.graphics.setColor(0.8, 0.8, 0.8, 1)
    love.graphics.rectangle("fill", self.width - 90, 5, 20, 20)  -- 缩小
    love.graphics.rectangle("fill", self.width - 65, 5, 20, 20) -- 隐藏
    love.graphics.rectangle("fill", self.width - 40, 5, 20, 20) -- 关闭
    
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.print("-", self.width - 85, 5)  -- 缩小
    love.graphics.print("_", self.width - 60, 5) -- 隐藏
    love.graphics.print("X", self.width - 35, 5) -- 关闭
    
    -- 绘制页面内容
    love.graphics.setColor(1, 1, 1, 1)
    if self.currentPage == "公告" then
        love.graphics.printf(self.pages.公告.content, 50, 50, self.width - 100, "left")
    elseif self.currentPage == "通用" then
        local startY = 50
        for i, item in ipairs(self.pages.通用.items) do
            love.graphics.setColor(0.7, 0.7, 0.7, 1)
            love.graphics.rectangle("fill", 50, startY + (i-1)*25, 200, 20)
            love.graphics.setColor(0, 0, 0, 1)
            love.graphics.print(item, 55, startY + (i-1)*25 + 2)
        end
    end
    
    -- 绘制页面切换按钮
    love.graphics.setColor(0.5, 0.5, 0.5, 1)
    love.graphics.rectangle("fill", 50, self.height - 40, 80, 30)
    love.graphics.rectangle("fill", 150, self.height - 40, 80, 30)
    
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.print("公告", 70, self.height - 35)
    love.graphics.print("通用", 170, self.height - 35)
    
    love.graphics.pop()
end

function PopupWindow:mousepressed(x, y, button)
    if not self.visible then return end
    
    -- 转换为局部坐标
    local localX = (x - self.x) / self.scale
    local localY = (y - self.y) / self.scale
    
    -- 检查标题栏拖动
    if button == 1 and localY <= 30 and localX >= 0 and localX <= self.width then
        self.dragging = true
        self.dragOffsetX = localX
        self.dragOffsetY = localY
    end
    
    -- 检查控制按钮
    if localY <= 30 then
        if localX >= self.width - 90 and localX <= self.width - 70 then
            self.scale = math.max(0.5, self.scale - 0.1)  -- 缩小
        elseif localX >= self.width - 65 and localX <= self.width - 45 then
            self.visible = false  -- 隐藏
        elseif localX >= self.width - 40 and localX <= self.width - 20 then
            love.event.quit()  -- 关闭
        end
    end
    
    -- 检查页面切换按钮
    if localY >= self.height - 40 and localY <= self.height - 10 then
        if localX >= 50 and localX <= 130 then
            self.currentPage = "公告"
        elseif localX >= 150 and localX <= 230 then
            self.currentPage = "通用"
        end
    end
    
    -- 检查星星点击
    for _, star in ipairs(self.stars) do
        if star:contains(localX, localY) then
            star.clickEffect = true
            star.effectSize = star.size
            star.effectAlpha = 1.0
            break
        end
    end
    
    -- 检查功能按钮点击（通用页面）
    if self.currentPage == "通用" then
        local startY = 50
        for i, item in ipairs(self.pages.通用.items) do
            if localX >= 50 and localX <= 250 and 
               localY >= startY + (i-1)*25 and localY <= startY + (i-1)*25 + 20 then
                print("点击了: " .. item)
                if item == "透视" then
                    -- 透视特效处理
                    print("显示玩家名字，透视玩家，边缘彩色效果")
                end
                break
            end
        end
    end
end

function PopupWindow:mousemoved(x, y)
    if self.dragging then
        self.x = x - self.dragOffsetX * self.scale
        self.y = y - self.dragOffsetY * self.scale
    end
end

function PopupWindow:mousereleased(x, y, button)
    if button == 1 then
        self.dragging = false
    end
end

-- 主程序
function love.load()
    love.window.setTitle("Lua UI 弹窗示例")
    love.window.setMode(800, 600)
    
    popup = PopupWindow.new()
end

function love.update(dt)
    popup:update(dt)
end

function love.draw()
    popup:draw()
end

function love.mousepressed(x, y, button)
    popup:mousepressed(x, y, button)
end

function love.mousemoved(x, y)
    popup:mousemoved(x, y)
end

function love.mousereleased(x, y, button)
    popup:mousereleased(x, y, button)
end

function love.keypressed(key)
    if key == "h" then
        popup.visible = not popup.visible
    elseif key == "escape" then
        love.event.quit()
    end
end
