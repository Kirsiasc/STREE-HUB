-- Aktifkan/Berhentikan fitur infinite jump
_G.STREE_INFINITE_JUMP = _G.STREE_INFINITE_JUMP or false

-- Matikan loop sebelumnya jika aktif
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
        local char = LocalPlayer.Character
        if char then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if humanoid and hrp and humanoid:GetState() ~= Enum.HumanoidStateType.Dead then
                -- Pastikan Y-Velocity minimal
                local vel = hrp.Velocity
                hrp.Velocity = Vector3.new(vel.X, math.max(60, vel.Y), vel.Z)
                humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
            end
        end
    end
end)
