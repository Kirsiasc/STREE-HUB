-- STREE HUB ESP Line Tracer Hijau Neon [Toggle Support]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

_G.STREE_ESP_TRACER = _G.STREE_ESP_TRACER or false

local tracers = {}

-- Buat garis untuk player
local function CreateTracer(player)
    if tracers[player] then return end

    local line = Drawing.new("Line")
    line.Color = Color3.fromRGB(0, 255, 0) -- Hijau neon
    line.Thickness = 1
    line.Transparency = 1
    line.Visible = false

    tracers[player] = line
end

-- Hapus garis
local function RemoveTracer(player)
    if tracers[player] then
        tracers[player]:Remove()
        tracers[player] = nil
    end
end

-- Loop utama ESP Tracer
local function StartTracerESP()
    RunService.RenderStepped:Connect(function()
        if not _G.STREE_ESP_TRACER then
            for _, line in pairs(tracers) do
                line.Visible = false
            end
            return
        end

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                if not tracers[player] then
                    CreateTracer(player)
                end

                local hrp = player.Character.HumanoidRootPart
                local tracer = tracers[player]

                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y) -- Bawah tengah layar
                    tracer.To = Vector2.new(screenPos.X, screenPos.Y)
                    tracer.Visible = true
                else
                    tracer.Visible = false
                end
            else
                RemoveTracer(player)
            end
        end
    end)

    Players.PlayerRemoving:Connect(RemoveTracer)
end

-- Jalankan jika toggle aktif
if _G.STREE_ESP_TRACER then
    StartTracerESP()
end
