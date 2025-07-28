-- STREE HUB | Cooldown Base Countdown Akurat - Steal A Brainrot

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
	txt.TextColor3 = Color3.fromRGB(255, 255, 255)
	txt.TextStrokeTransparency = 0
	txt.TextScaled = true
	txt.Font = Enum.Font.SourceSansBold
	txt.Name = "CooldownLabel"
	txt.Text = "..."
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

						-- Cek Value langsung
						if part:FindFirstChild("Cooldown") and part.Cooldown:IsA("NumberValue") then
							cooldownValue = part.Cooldown.Value

						-- Cek Attribute
						elseif part:GetAttribute("Cooldown") then
							cooldownValue = part:GetAttribute("Cooldown")
						end

						-- Tampilkan countdown jika ditemukan
						if cooldownValue then
							if tonumber(cooldownValue) <= 0 then
								label.Text = "READY"
							else
								label.Text = string.format("%.2f", cooldownValue)
							end
						else
							label.Text = "..."
						end

						wait(0.1)
					end
				end)
			end
		end
		wait(1)
	end
end)

-- Bersihkan jika toggle dimatikan
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
