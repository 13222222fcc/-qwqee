local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Script Hub",
    LoadingTitle = "Loading Interface",
    LoadingSubtitle = "by Developer",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ScriptHub",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = false,
    KeySettings = {
        Title = "Key System",
        Subtitle = "Enter Key",
        Note = "No Key Required",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    }
})

local MainTab = Window:CreateTab("Main", 4483362458)

local InfiniteJumpSection = MainTab:CreateSection("Infinite Jump")

local InfiniteJumpToggle = MainTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJumpToggle",
    Callback = function(Value)
        if Value then
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
        end
    end,
})

local SpeedSection = MainTab:CreateSection("Speed Hack")

local SpeedSlider = MainTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(Value)
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        humanoid.WalkSpeed = Value
    end,
})

Rayfield:LoadConfiguration()local Players = game:GetService("Players")
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
