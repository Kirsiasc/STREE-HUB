-- Auto cek toggle tiap detik
task.spawn(function()
    while true do
        task.wait(1)
        if _G.STREE_INFINITE_JUMP and not _G._INFINITE_JUMP_CONNECTION then
            EnableInfiniteJump()
        elseif not _G.STREE_INFINITE_JUMP and _G._INFINITE_JUMP_CONNECTION then
            _G._INFINITE_JUMP_CONNECTION:Disconnect()
            _G._INFINITE_JUMP_CONNECTION = nil
        end
    end
end)

-- Inisialisasi toggle jika belum ada
_G.STREE_INFINITE_JUMP = _G.STREE_INFINITE_JUMP or false

-- Cek apakah sudah pernah terkoneksi
if not _G._InfiniteJumpConnection then
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    -- Fungsi utama Infinite Jump
    _G._InfiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
        if _G.STREE_INFINITE_JUMP then
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                    -- Lewati sistem operasi anti-jump
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                end
            end
        end
    end)
end
