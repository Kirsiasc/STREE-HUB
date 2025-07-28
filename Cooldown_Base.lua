-- STREE HUB | Angka Countdown Real-Time - Putih Neon - Steal A Brainrot

local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

_G.STREE_COOLDOWN_BASE = _G.STREE_COOLDOWN_BASE or true

local COOLDOWN_NAMES = { "Base", "Totem", "Cooldown", "Altar", "Operate", "Station" }

local function CreateBillboard()
	local bb = Instance.new("BillboardGui")
	bb.Name = "STREE_COOLDOWN"
	bb.Size = UDim2.new(0, 100, 0, 40)
	bb.StudsOffset = Vector3.new(0, 3.5, 0)
	bb.AlwaysOnTop = true

	local txt = Instance.new("TextLabel", bb)
	txt.Size = UDim2.new(1, 0, 1, 0)
	txt.BackgroundTransparency = 1
	txt.TextColor3 = Color3.fromRGB(255, 255, 255) -- Putih Neon
	txt.TextStrokeTransparency = 0
	txt.TextScaled = true
	txt.Font = Enum.Font.SourceSansBold
	txt.Name = "CooldownLabel"
	txt.Text = "0.00"
	return bb
end

local function isCooldownBase(part)
	if not part:IsA("BasePart") then return false end
	for _, keyword in ipairs(COOLDOWN_NAMES) do
		if string.lower(part.Name):find(string.lower(keyword)) then
			return true
		end
	end
	return false
end

task.spawn(function()
	while _G.STREE_COOLDOWN_BASE do
		for _, part in ipairs(Workspace:GetDescendants()) do
			if isCooldownBase(part) and not part:FindFirstChild("STREE_COOLDOWN") then
				local bb = CreateBillboard()
				bb.Adornee = part
				bb.Parent = part

				local label = bb:WaitForChild("CooldownLabel")

				task.spawn(function()
					while bb and bb.Parent and _G.STREE_COOLDOWN_BASE do
						local cooldownValue = nil

						-- Ambil value asli dari game
						if part:FindFirstChild("Cooldown") and part.Cooldown:IsA("NumberValue") then
							cooldownValue = part.Cooldown.Value
						elseif part:GetAttribute("Cooldown") then
							cooldownValue = part:GetAttribute("Cooldown")
						end

						-- Update hanya angka, tidak ada tulisan lain
						if cooldownValue then
							label.Text = string.format("%.2f", tonumber(cooldownValue))
						end

						wait(0.1)
					end
				end)
			end
		end
		wait(1)
	end
end)

-- Auto hapus jika toggle dimatikan
RunService.RenderStepped:Connect(function()
	if not _G.STREE_COOLDOWN_BASE then
		for _, part in ipairs(Workspace:GetDescendants()) do
			local gui = part:FindFirstChild("STREE_COOLDOWN")
			if gui then
				gui:Destroy()
			end
		end
	end
end)
	if not _G.STREE_COOLDOWN_BASE then
		for _, part in ipairs(Workspace:GetDescendants()) do
			local gui = part:FindFirstChild("STREE_COOLDOWN")
			if gui then
				gui:Destroy()
			end
		end
	end
end)
