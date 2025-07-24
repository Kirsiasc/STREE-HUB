-- STREE HUB | Infinite Jump Anti-Bypass (2025)
-- Dibuat oleh kirsiasc

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- Anti-bypass logic (re-apply jump power + reset states)
local canIJ = true
local jumping = false
local oldState = nil

-- Reset function (anti-disable by game)
local function enforceJump()
    if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
        lp.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        lp.Character.Humanoid:Move(Vector3.new(0,1,0), true)
    end
end

-- Main handler
UserInputService.JumpRequest:Connect(function()
    if canIJ and lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
        enforceJump()
    end
end)

-- Re-enable after landing
RunService.Stepped:Connect(function()
    pcall(function()
        local state = hum:GetState()
        if state == Enum.HumanoidStateType.Freefall then
            jumping = true
        elseif state == Enum.HumanoidStateType.Seated or state == Enum.HumanoidStateType.Running or state == Enum.HumanoidStateType.Landed then
            jumping = false
        end
    end)
end)

-- Auto-reapply every few seconds (bypass most anti-modifiers)
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            if lp.Character and lp.Character:FindFirstChildOfClass("Humanoid") then
                hum = lp.Character:FindFirstChildOfClass("Humanoid")
                hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
                hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
            end
        end)
    end
end)

-- Notification (optional)
pcall(function()
    game.StarterGui:SetCore("SendNotification", {
        Title = "STREE HUB",
        Text = "Infinite Jump Aktif ✅",
        Duration = 3
    })
end)
