-- STREE HUB | Cooldown Base ESP Putih Neon | Steal A Brainrot Compatible
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Camera = Workspace.CurrentCamera

_G.STREE_COOLDOWN_BASE = _G.STREE_COOLDOWN_BASE or false

-- Ganti nama-nama base cooldown di bawah ini sesuai dengan yang dipakai di Steal A Brainrot
local COOLDOWN_NAMES = { "Base", "Totem", "Cooldown", "Altar", "Operate", "Station" }

local espTable = {}

-- Cek apakah part cocok dengan nama-nama cooldown
local function isCooldownBase(part)
    if not part:IsA("BasePart") then return false end
    for _, keyword in pairs(COOLDOWN_NAMES) do
        if string.lower(part.Name):find(string.lower(keyword)) then
            return true
        end
    end
    return false
end

-- Buat ESP neon putih
local function createESP(part)
    if espTable[part] then return end

    local dot = Drawing.new("Circle")
    dot.Color = Color3.fromRGB(255, 255, 255) -- Putih neon
    dot.Thickness = 2
    dot.Radius = 5
    dot.Filled = true
    dot.Transparency = 1
    dot.Visible = false

    espTable[part] = dot
end

-- Hapus ESP dari part
local function removeESP(part)
    if espTable[part] then
        espTable[part]:Remove()
        espTable[part] = nil
    end
end

-- Scan dan tandai semua base cooldown
local function scanCooldownParts()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        if isCooldownBase(obj) then
            createESP(obj)
        end
    end
end

-- Render ESP loop
local function renderLoop()
    RunService.RenderStepped:Connect(function()
        if not _G.STREE_COOLDOWN_BASE then
            for _, dot in pairs(espTable) do
                dot.Visible = false
            end
            return
        end

        for part, dot in pairs(espTable) do
            if part and part.Parent then
                local pos, onScreen = Camera:WorldToViewportPoint(part.Position + Vector3.new(0, 2, 0))
                if onScreen then
                    dot.Position = Vector2.new(pos.X, pos.Y)
                    dot.Visible = true
                else
                    dot.Visible = false
                end
            else
                removeESP(part)
            end
        end
    end)
end

-- Eksekusi
scanCooldownParts()
renderLoop()
