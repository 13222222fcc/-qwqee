local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local JUMP_POWER = 50
local JUMP_COOLDOWN = 0.2
local canJump = true

UIS.JumpRequest:Connect(function()
    if not canJump then return end
    if humanoid:GetState() == Enum.HumanoidStateType.Dead then return end
    
    canJump = false
    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    
    if character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.Velocity = Vector3.new(
            character.HumanoidRootPart.Velocity.X,
            JUMP_POWER,
            character.HumanoidRootPart.Velocity.Z
        )
    end
    
    task.wait(JUMP_COOLDOWN)
    canJump = true
end)

local WALK_SPEED = 100
humanoid.WalkSpeed = WALK_SPEED

player.CharacterAdded:Connect(function(newCharacter)
    local newHumanoid = newCharacter:WaitForChild("Humanoid")
    newHumanoid.WalkSpeed = WALK_SPEED
end)
