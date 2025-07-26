-- STREE HUB | ESP HIGHLIGHT by kirsiasc
-- Warna Fill Putih & Outline Hijau Neon

local ESP_Highlight_Enabled = false
local highlightTable = {}

-- Fungsi aktifkan ESP Highlight
local function EnableESPHighlight()
    -- Bersihkan highlight sebelumnya
    for _, h in pairs(highlightTable) do
        if h and h.Parent then
            h:Destroy()
        end
    end
    highlightTable = {}

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            local highlight = Instance.new("Highlight")
            highlight.Name = "STREE_Highlight"
            highlight.FillColor = Color3.fromRGB(255, 255, 255) -- Putih
            highlight.OutlineColor = Color3.fromRGB(57, 255, 20) -- Hijau Neon
            highlight.FillTransparency = 0.3
            highlight.OutlineTransparency = 0
            highlight.Adornee = player.Character
            highlight.Parent = player.Character
            table.insert(highlightTable, highlight)
        end
    end
end

-- Fungsi matikan ESP Highlight
local function DisableESPHighlight()
    for _, h in pairs(highlightTable) do
        if h and h.Parent then
            h:Destroy()
        end
    end
    highlightTable = {}
end

-- Loop pembaruan ESP
task.spawn(function()
    while true do
        if ESP_Highlight_Enabled then
            EnableESPHighlight()
        end
        task.wait(1.5)
    end
end)

-- Tambahkan Toggle ke Tab Visual
VisualTab:AddToggle({
    Name = "ESP Highlight (Putih & Hijau Neon)",
    Default = false,
    Callback = function(state)
        ESP_Highlight_Enabled = state
        if not state then
            DisableESPHighlight()
        end
    end
})
