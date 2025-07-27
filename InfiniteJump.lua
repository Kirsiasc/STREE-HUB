-- Inisialisasi toggle
_G.STREE_INFINITE_JUMP = _G.STREE_INFINITE_JUMP or false

-- Hindari koneksi dobel
if not _G._INFINITE_JUMP_CONNECTION then
    local UserInputService = game:GetService("UserInputService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    -- Koneksi permanen (sekali jalan)
    _G._INFINITE_JUMP_CONNECTION = UserInputService.JumpRequest:Connect(function()
        if _G.STREE_INFINITE_JUMP then
            local Character = LocalPlayer.Character
            if Character then
                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                local HRP = Character:FindFirstChild("HumanoidRootPart")
                if Humanoid and HRP and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                    -- Melompat paksa, bypass anti-jump
                    HRP.Velocity = Vector3.new(HRP.Velocity.X, 50, HRP.Velocity.Z)
                    Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                end
            end
        end
    end)
end
