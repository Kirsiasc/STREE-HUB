-- STREE HUB ESP Name Hijau Neon dengan Toggle
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

_G.STREE_ESP_NAME = _G.STREE_ESP_NAME or false

local nameTags = {}

-- Buat NameTag
local function CreateNameTag(player)
    if nameTags[player] then return end

    local tag = Drawing.new("Text")
    tag.Text = player.Name
    tag.Size = 13
    tag.Color = Color3.fromRGB(0, 255, 0) -- Hijau neon
    tag.Center = true
    tag.Outline = true
    tag.OutlineColor = Color3.new(0, 0, 0)
    tag.Visible = false

    nameTags[player] = tag
end

-- Hapus NameTag
local function RemoveNameTag(player)
    if nameTags[player] then
        nameTags[player]:Remove()
        nameTags[player] = nil
    end
end

-- Loop utama ESP Name
local function StartESPName()
    RunService.RenderStepped:Connect(function()
        if not _G.STREE_ESP_NAME then
            for _, tag in pairs(nameTags) do
                tag.Visible = false
            end
            return
        end

        for _, player in pairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                if not nameTags[player] then
                    CreateNameTag(player)
                end

                local head = player.Character.Head
                local pos, onScreen = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 1.5, 0))

                local tag = nameTags[player]
                if onScreen then
                    tag.Position = Vector2.new(pos.X, pos.Y)
                    tag.Text = player.Name
                    tag.Visible = true
                else
                    tag.Visible = false
                end
            else
                RemoveNameTag(player)
            end
        end
    end)

    -- Bersihkan saat player keluar
    Players.PlayerRemoving:Connect(function(player)
        RemoveNameTag(player)
    end)
end

-- Mulai jika toggle aktif
if _G.STREE_ESP_NAME then
    StartESPName()
end
