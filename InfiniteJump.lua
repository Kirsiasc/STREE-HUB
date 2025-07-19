-- Infinite Jump Anti-Bypass | STREE HUB by Kirsiasc
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local InfiniteJumpEnabled = true -- bisa dikontrol lewat GUI atau key system

-- Fungsi loncat aman
local function SafeJump()
    local char = player.Character
    if not char then return end

    local hum = char:FindFirstChildWhichIsA("Humanoid")
    if hum and hum:GetState() ~= Enum.HumanoidStateType.Dead then
        -- Cek apakah posisi karakter di udara (biar gak spam pas di tanah)
        local root = char:FindFirstChild("HumanoidRootPart")
        if root and not hum.FloorMaterial then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end

-- Deteksi tombol space ditekan (JumpRequest)
UserInputService.JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        SafeJump()
    end
end)

-- Deteksi karakter respawn agar tetap aktif
player.CharacterAdded:Connect(function(char)
    repeat task.wait() until char:FindFirstChildOfClass("Humanoid")
    -- optional: auto aktifkan kembali InfiniteJump setelah respawn
end)
