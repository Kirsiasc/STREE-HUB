-- Inisialisasi toggle global
_G.STREE_FLOAT = _G.STREE_FLOAT or false

-- Fungsi utama Float + WASD
local function FloatWithWASD()
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")

    local Player = Players.LocalPlayer
    local Character = Player.Character or Player.CharacterAdded:Wait()
    local HRP = Character:WaitForChild("HumanoidRootPart")

    -- Nonaktifkan koneksi lama
    if _G._FLOAT_CONNECTION then
        _G._FLOAT_CONNECTION:Disconnect()
        _G._FLOAT_CONNECTION = nil
    end

    -- Buat variabel arah
    local moveDirection = Vector3.zero

    -- Update arah saat tombol ditekan
    local function UpdateDirection()
        moveDirection = Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection += Vector3.new(0, 0, -1)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then
            moveDirection += Vector3.new(0, 0, 1)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection += Vector3.new(-1, 0, 0)
        end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection += Vector3.new(1, 0, 0)
        end
    end

    -- Jika Float aktif
    if _G.STREE_FLOAT then
        _G._FLOAT_CONNECTION = RunService.RenderStepped:Connect(function()
            if not Player.Character or not HRP then return end
            UpdateDirection()

            local camCF = workspace.CurrentCamera.CFrame
            local moveVec = (camCF:VectorToWorldSpace(moveDirection)).Unit
            if moveDirection == Vector3.zero then
                moveVec = Vector3.zero
            end

            -- Kecepatan bisa diatur
            local speed = 5
            local newPos = HRP.Position + moveVec * speed * RunService.RenderStepped:Wait()
            HRP.Velocity = Vector3.zero
            HRP.CFrame = CFrame.new(newPos.X, HRP.Position.Y + 0.1, newPos.Z)
        end)
    end
end

-- Loop toggle
task.spawn(function()
    while true do
        FloatWithWASD()
        task.wait(0.3)
    end
end)
