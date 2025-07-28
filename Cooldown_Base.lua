-- STREE HUB | Real-Time Cooldown Timer (Auto Scan All Bases) - Steal A Brainrot

local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

_G.STREE_COOLDOWN_BASE = _G.STREE_COOLDOWN_BASE or true

local COOLDOWN_NAMES = { "Base", "Totem", "Cooldown", "Altar", "Operate", "Station" }

-- Fungsi bikin angka putih neon
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
	txt.Text = "0.00"
	return bb
end

-- Cek nama base cocok
local function isCooldownBase(part)
	if not part:IsA("BasePart") then return false end
	for _, keyword in ipairs(COOLDOWN_NAMES) do
		if string.lower(part.Name):find(string.lower(keyword)) then
			return true
		end
	end
	return false
end

-- Coba ambil nilai waktu dari berbagai sumber
local function GetCooldownTime(part)
	-- Prioritas 1: NumberValue anak
	for _, child in pairs(part:GetChildren()) do
		if child:IsA("NumberValue") or child:IsA("IntValue") then
			if string.lower(child.Name):find("cool") or string.lower(child.Name):find("time") then
				return child.Value
			end
		end
	end

	-- Prioritas 2: Attribute
	for _, attrName in pairs(part:GetAttributes()) do
		local success, value = pcall(function()
			return part:GetAttribute(attrName)
		end)
		if success and type(value) == "number" and attrName:lower():find("cool") then
			return value
		end
	end

	return nil -- tidak ada nilai
end

-- Loop utama: scan semua base dan tampilkan countdown
task.spawn(function()
	while _G.STREE_COOLDOWN_BASE do
		for _, part in pairs(Workspace:GetDescendants()) do
			if isCooldownBase(part) and not part:FindFirstChild("STREE_COOLDOWN") then
				local bb = CreateBillboard()
				bb.Adornee = part
				bb.Parent = part
				local label = bb:WaitForChild("CooldownLabel")

				task.spawn(function()
					while bb and bb.Parent and _G.STREE_COOLDOWN_BASE do
						local value = GetCooldownTime(part)
						if value then
							label.Text = string.format("%.2f", value)
						else
							label.Text = "" -- tidak tampil jika tidak ada cooldown
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
		for _, part in pairs(Workspace:GetDescendants()) do
			local gui = part:FindFirstChild("STREE_COOLDOWN")
			if gui then gui:Destroy() end
		end
	end
end)
