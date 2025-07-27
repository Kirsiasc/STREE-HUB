-- STREE HUB ESP Highlight Putih + Pinggiran Hijau Neon
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

_G.STREE_ESP_HIGHLIGHT = _G.STREE_ESP_HIGHLIGHT or false

-- Simpan ESP agar bisa dihapus saat toggle OFF
local activeESP = {}

-- Fungsi untuk buat ESP
local function CreateESP(player)
    if player == Players.LocalPlayer then return end
    if not player.Character then return end
    if activeESP[player] then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "STREE_ESP"
    highlight.FillColor = Color3.fromRGB(255, 255, 255) -- Putih
    highlight.OutlineColor = Color3.fromRGB(0, 255, 0)  -- Hijau Neon
    highlight.FillTransparency = 0.2
    highlight.OutlineTransparency = 0
    highlight.Adornee = player.Character
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.Parent = player.Character

    activeESP[player] = highlight
end

-- Hapus semua ESP
local function RemoveAllESP()
    for player, highlight in pairs(activeESP) do
        if highlight and highlight.Parent then
            highlight:Destroy()
        end
    end
    activeESP = {}
end

-- Loop utama ESP
local function EnableESP()
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not _G.STREE_ESP_HIGHLIGHT then
            if connection then connection:Disconnect() end
            RemoveAllESP()
            return
        end

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= Players.LocalPlayer and player.Character then
                if not activeESP[player] then
                    CreateESP(player)
                elseif activeESP[player].Adornee ~= player.Character then
                    -- Update adornee kalau character berubah
                    activeESP[player].Adornee = player.Character
                end
            end
        end
    end)
end

-- Mulai kalau toggle ON
if _G.STREE_ESP_HIGHLIGHT then
    EnableESP()
end
