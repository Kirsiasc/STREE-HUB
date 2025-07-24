-- STREE HUB | ESP HIGHLIGHT v1 by kirsiasc
-- Warna Fill Putih & Outline Hijau Neon

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Fungsi untuk menambahkan highlight ke player lain
local function addESP(player)
    if player == LocalPlayer then return end
    player.CharacterAdded:Connect(function(char)
        local hl = Instance.new("Highlight")
        hl.Name = "STREE_HIGHLIGHT"
        hl.FillColor = Color3.new(1, 1, 1) -- Putih
        hl.OutlineColor = Color3.fromRGB(0, 255, 0) -- Hijau Neon
        hl.FillTransparency = 0.2
        hl.OutlineTransparency = 0
        hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        hl.Adornee = char
        hl.Parent = char
    end)

    -- Jika sudah spawn
    if player.Character then
        local char = player.Character
        if not char:FindFirstChild("STREE_HIGHLIGHT") then
            local hl = Instance.new("Highlight")
            hl.Name = "STREE_HIGHLIGHT"
            hl.FillColor = Color3.new(1, 1, 1)
            hl.OutlineColor = Color3.fromRGB(0, 255, 0)
            hl.FillTransparency = 0.2
            hl.OutlineTransparency = 0
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            hl.Adornee = char
            hl.Parent = char
        end
    end
end

-- Tambahkan ESP ke semua player yang ada
for _, plr in pairs(Players:GetPlayers()) do
    addESP(plr)
end

-- Tambahkan ESP saat player baru masuk
Players.PlayerAdded:Connect(function(plr)
    addESP(plr)
end)
