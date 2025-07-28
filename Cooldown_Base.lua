-- STREE HUB - Cooldown Base Visual (Green Neon)
-- Bypass AntiCheat Ready

if not _G.STREE_COOLDOWN_BASE then return end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")

local CooldownTagName = "BaseCooldown" -- bisa kamu sesuaikan
local Active = true

-- Buat tag text
local function CreateBillboard(text)
	local bb = Instance.new("BillboardGui")
	bb.Name = "CooldownBB"
	bb.Size = UDim2.new(0, 100, 0, 50)
	bb.StudsOffset = Vector3.new(0, 3, 0)
	bb.AlwaysOnTop = true

	local txt = Instance.new("TextLabel", bb)
	txt.Size = UDim2.new(1, 0, 1, 0)
	txt.BackgroundTransparency = 1
	txt.Text = tostring(text)
	txt.TextColor3 = Color3.fromRGB(0, 255, 0)
	txt.TextStrokeTransparency = 0
	txt.TextScaled = true
	txt.Font = Enum.Font.SourceSansBold

	return bb
end

-- Update Loop
local function StartCooldownLoop()
	while _G.STREE_COOLDOWN_BASE and task.wait(0.1) do
		pcall(function()
			for _, obj in pairs(Workspace:GetDescendants()) do
				if obj:IsA("BasePart") and obj:FindFirstChild("CooldownBB") == nil then
					if obj.Name:lower():find("cooldown") or obj.Name:lower():find("base") then
						local bb = CreateBillboard("🟢")
						bb.Parent = obj
					end
				end
			end
		end)
	end
end

-- Mulai loop di thread aman
task.spawn(StartCooldownLoop)

-- Bersihkan saat toggle dimatikan
RunService.RenderStepped:Connect(function()
	if not _G.STREE_COOLDOWN_BASE then
		for _, obj in pairs(Workspace:GetDescendants()) do
			if obj:FindFirstChild("CooldownBB") then
				obj.CooldownBB:Destroy()
			end
		end
	end
end)

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
