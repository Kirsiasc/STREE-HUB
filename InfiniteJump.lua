-- Infinite Jump - STREE HUB | Steal A Brainrot

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local InfiniteJumpEnabled = true -- Bisa diganti lewat GUI/key system

UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local character = player.Character
        if character and character:FindFirstChild("Humanoid") and character:FindFirstChild("HumanoidRootPart") then
            -- Cegah error saat belum respawn
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)
