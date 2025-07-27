-- Koordinat keluar map, aman dari NPC dan player
local SafePos = Vector3.new(-4518, 175, -1021)

-- Fungsi teleport
local function TeleportToSafeZone()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HRP = Character:WaitForChild("HumanoidRootPart")

    HRP.CFrame = CFrame.new(SafePos)
end

-- Jalankan
TeleportToSafeZone()
