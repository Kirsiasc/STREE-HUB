-- STREE HUB | ESP Kotak (Box) v1 by kirsiasc
-- Gunakan di executor yang mendukung Drawing API (Synapse, Fluxus, dll)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local espBoxes = {}
local ESPBox_Enabled = false

-- Buat ESP Box baru
local function createBox(player)
    if espBoxes[player] then return end

    local box = Drawing.new("Square")
    box.Color = Color3.fromRGB(0, 255, 0) -- Hijau Neon
    box.Thickness = 1.5
    box.Filled = false
    box.Transparency = 1
    box.Visible = false

    espBoxes[player] = box
end

-- Hapus saat player keluar
Players.PlayerRemoving:Connect(function(player)
    if espBoxes[player] then
        espBoxes[player]:Remove()
        espBoxes[player] = nil
    end
end)

-- Render loop untuk update box
RunService.RenderStepped:Connect(function()
    if not ESPBox_Enabled then
        for _, box in pairs(espBoxes) do
            box.Visible = false
        end
        return
    end

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = player.Character.HumanoidRootPart
            local rootPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

            if not espBoxes[player] then
                createBox(player)
            end

            local box = espBoxes[player]

            if onScreen then
                local pos1 = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(-2, 3, 0))
                local pos2 = Camera:WorldToViewportPoint(hrp.Position + Vector3.new(2, -3, 0))

                local sizeX = math.abs(pos2.X - pos1.X)
                local sizeY = math.abs(pos2.Y - pos1.Y)

                box.Size = Vector2.new(sizeX, sizeY)
                box.Position = Vector2.new(pos1.X, pos1.Y)
                box.Visible = true
            else
                box.Visible = false
            end
        elseif espBoxes[player] then
            espBoxes[player].Visible = false
        end
    end
end)

-- Tambahkan Toggle ke VisualTab (OrionLib)
VisualTab:AddToggle({
    Name = "ESP Kotak (Box)",
    Default = false,
    Callback = function(value)
        ESPBox_Enabled = value
        if not value then
            for _, box in pairs(espBoxes) do
                if box then box.Visible = false end
            end
        end
    end
})
