-- Infinite Jump by Kirsiasc
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local UNLOCKED = true -- Ganti ke false kalau kamu pakai sistem key
local InfiniteJumpEnabled = true -- Atur ke false kalau mau nonaktifkan manual

UserInputService.JumpRequest:Connect(function()
    if UNLOCKED and InfiniteJumpEnabled then
        local character = player.Character
        local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
