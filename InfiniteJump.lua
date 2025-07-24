-- STREE HUB | Infinite Jump Fixed for "Steal A Brainrot"
-- Dibuat oleh kirsiasc - 2025

if not game:IsLoaded() then game.Loaded:Wait() end

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- Auto update if character dies
lp.CharacterAdded:Connect(function(c)
    char = c
    hum = c:WaitForChild("Humanoid")
end)

-- Infinite Jump Flag
local InfiniteJump = true

-- Anti-bypass: forcibly trigger Jumping state without using .Jump
UserInputService.JumpRequest:Connect(function()
    if InfiniteJump and lp.Character and hum and hum:GetState() ~= Enum.HumanoidStateType.Seated then
        -- Create invisible part and teleport player slightly
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            root.Velocity = Vector3.new(0, 50, 0) -- Upward velocity instead of jump flag
            hum:ChangeState(Enum.HumanoidStateType.Freefall)
        end
    end
end)

-- Constantly force states enabled (anti-disable by game)
RunService.Stepped:Connect(function()
    if hum then
        pcall(function()
            hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
            hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
        end)
    end
end)

-- UI Notification (opsional)
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "STREE HUB",
        Text = "Infinite Jump Aktif (Anti SAB)",
        Duration = 5
    })
end)
