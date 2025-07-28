-- Inisialisasi toggle global
_G.STREE_HELPER = _G.STREE_HELPER or false

-- Fungsi utama Helper
local function RunHelper()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local Player = Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()

    -- Pastikan karakter ada
    local HRP = Character:WaitForChild("HumanoidRootPart")

    -- Putuskan koneksi lama jika ada
    if _G._HELPER_CONNECTION then
        _G._HELPER_CONNECTION:Disconnect()
        _G._HELPER_CONNECTION = nil
    end

    -- Fungsi jika toggle aktif
    if _G.STREE_HELPER then
        _G._HELPER_CONNECTION = RunService.Stepped:Connect(function()
            pcall(function()
                -- Cegah Ragdoll
                if Character:FindFirstChild("Ragdoll") then
                    Character.Ragdoll:Destroy()
                end

                -- Cegah Humanoid mati / rusak
                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                if Humanoid then
                    Humanoid:ChangeState(11) -- Physics agar tidak jatuh
                    Humanoid:RemoveAccessories() -- opsional, anti deteksi

                    -- Reset ulang posisi jika stuck (opsional)
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
                end

                -- Anti Fall + Lewat Arena
                HRP.Velocity = Vector3.zero
                HRP.CanCollide = false
            end)
        end)
    end
end

-- Loop pantau toggle
task.spawn(function()
    while true do
        RunHelper()
        task.wait(0.3)
    end
end)
