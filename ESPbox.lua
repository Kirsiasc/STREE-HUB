-- STREE HUB ESP Box Biasa dengan Toggle
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

_G.STREE_ESP_BOX = _G.STREE_ESP_BOX or false

local espBoxes = {}

-- Buat box baru
local function CreateBox(player)
    if espBoxes[player] then return end
    local box = Drawing.new("Square")
    box.Visible = false
    box.Thickness = 1
    box.Filled = false
    box.Transparency = 1
    box.Color = Color3.fromRGB(255, 255, 255) -- Warna putih
    espBoxes[player] = box
end

-- Hapus box
local function RemoveBox(player)
    if espBoxes[player] then
        espBoxes[player]:Remove()
        espBoxes[player] = nil
    end
end

-- Loop ESP Box
local function StartESP()
    RunService.RenderStepped:Connect(function()
        if not _G.STREE_ESP_BOX then
            for _, box in pairs(espBoxes) do
                box.Visible = false
            end
            return
        end

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")

                if not espBoxes[player] then
                    CreateBox(player)
                end

                local box = espBoxes[player]
                local pos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

                if onScreen then
                    local distance = (Camera.CFrame.Position - hrp.Position).Magnitude
                    local size = math.clamp(3000 / distance, 2, 300)
                    local width = size / 2
                    local height = size

                    box.Size = Vector2.new(width, height)
                    box.Position = Vector2.new(pos.X - width / 2, pos.Y - height / 2)
                    box.Visible = true
                else
                    box.Visible = false
                end
            else
                RemoveBox(player)
            end
        end
    end)

    -- Bersihkan jika ada player keluar
    Players.PlayerRemoving:Connect(function(player)
        RemoveBox(player)
    end)
end

-- Eksekusi
if _G.STREE_ESP_BOX then
    StartESP()
end
