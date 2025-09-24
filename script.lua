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
local VisualTab = Window:CreateTab("Visuals", 4483362458)
local CombatTab = Window:CreateTab("Combat", 4483362458)

-- Infinite Jump Section
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

-- Speed Change Section
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

-- ESP/Wallhack Section
local ESPSection = VisualTab:CreateSection("ESP Settings")
local ESPToggle = VisualTab:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        if Value then
            -- Basic ESP implementation using Drawing library
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local LocalPlayer = Players.LocalPlayer
            local Camera = workspace.CurrentCamera
            
            local ESPObjects = {}
            
            local function CreateESP(character)
                local Highlight = Instance.new("Highlight")
                Highlight.Parent = character
                Highlight.Adornee = character
                Highlight.FillTransparency = 0.5
                Highlight.FillColor = Color3.fromRGB(255, 0, 0)
                Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                
                ESPObjects[character] = Highlight
            end
            
            local function RemoveESP(character)
                if ESPObjects[character] then
                    ESPObjects[character]:Destroy()
                    ESPObjects[character] = nil
                end
            end
            
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    CreateESP(player.Character)
                end
            end
            
            Players.PlayerAdded:Connect(function(player)
                player.CharacterAdded:Connect(function(character)
                    if player ~= LocalPlayer then
                        CreateESP(character)
                    end
                end)
            end)
            
            Players.PlayerRemoving:Connect(function(player)
                if player.Character then
                    RemoveESP(player.Character)
                end
            end)
        else
            -- Clean up ESP objects when disabled
            for _, object in pairs(ESPObjects) do
                object:Destroy()
            end
            ESPObjects = {}
        end
    end,
})

-- Aimbot Section
local AimbotSection = CombatTab:CreateSection("Aimbot Settings")
local AimbotToggle = CombatTab:CreateToggle({
    Name = "Enable Aimbot",
    CurrentValue = false,
    Flag = "AimbotToggle",
    Callback = function(Value)
        if Value then
            -- Basic Aimbot implementation
            local Players = game:GetService("Players")
            local RunService = game:GetService("RunService")
            local LocalPlayer = Players.LocalPlayer
            local Camera = workspace.CurrentCamera
            
            local function FindClosestPlayer()
                local closestPlayer = nil
                local shortestDistance = math.huge
                
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        
                        if humanoid and humanoid.Health > 0 and humanoidRootPart then
                            local distance = (LocalPlayer.Character.HumanoidRootPart.Position - humanoidRootPart.Position).Magnitude
                            if distance < shortestDistance then
                                shortestDistance = distance
                                closestPlayer = player
                            end
                        end
                    end
                end
                
                return closestPlayer
            end
            
            local aimbotConnection
            aimbotConnection = RunService.RenderStepped:Connect(function()
                local closestPlayer = FindClosestPlayer()
                if closestPlayer and closestPlayer.Character then
                    local targetRoot = closestPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if targetRoot then
                        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetRoot.Position)
                    end
                end
            end)
        else
            -- Disable aimbot
            if aimbotConnection then
                aimbotConnection:Disconnect()
                aimbotConnection = nil
            end
        end
    end,
})

Rayfield:LoadConfiguration()


