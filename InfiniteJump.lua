_G.STREE_INFINITE_JUMP = _G.STREE_INFINITE_JUMP or false

-- Hapus koneksi sebelumnya (jika ada) untuk mencegah dobel
if _G._INFINITE_JUMP_CONNECTION then
    _G._INFINITE_JUMP_CONNECTION:Disconnect()
    _G._INFINITE_JUMP_CONNECTION = nil
end

local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Fungsi lompat paksa
local function ForceJump()
    local HRP = Character:FindFirstChild("HumanoidRootPart")
    if HRP and Humanoid and _G.STREE_INFINITE_JUMP and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
        -- Bypass lompat tanpa batas
        HRP.Velocity = Vector3.new(HRP.Velocity.X, 80, HRP.Velocity.Z)
        Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
    end
end

-- Deteksi tombol SPACE ditekan
_G._INFINITE_JUMP_CONNECTION = UIS.InputBegan:Connect(function(input, isTyping)
    if not isTyping and input.KeyCode == Enum.KeyCode.Space and _G.STREE_INFINITE_JUMP then
        ForceJump()
    end
end)
