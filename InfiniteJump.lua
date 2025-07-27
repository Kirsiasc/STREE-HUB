_G.STREE_INFINITE_JUMP = _G.STREE_INFINITE_JUMP or false

-- Hapus loop sebelumnya
if _G._INFINITE_JUMP_LOOP then
    _G._INFINITE_JUMP_LOOP:Disconnect()
    _G._INFINITE_JUMP_LOOP = nil
end

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Loop render per frame
_G._INFINITE_JUMP_LOOP = RunService.RenderStepped:Connect(function()
    if _G.STREE_INFINITE_JUMP then
        local Character = LocalPlayer.Character
        if Character then
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            local HRP = Character:FindFirstChild("HumanoidRootPart")
            if Humanoid and HRP and Humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                -- Beri dorongan ke atas konstan
                HRP.Velocity = Vector3.new(HRP.Velocity.X, 60, HRP.Velocity.Z)
                Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
            end
        end
    end
end)
