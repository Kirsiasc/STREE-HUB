-- STREE HUB | ESP Line Tracer by kirsiasc
-- Garis ke setiap pemain lain

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Tabel penyimpan garis
local lines = {}

-- Fungsi untuk membuat garis baru
local function createLine(player)
	if player == LocalPlayer then return end
	if lines[player] then lines[player]:Remove() end

	local line = Drawing.new("Line")
	line.Thickness = 1.5
	line.Color = Color3.fromRGB(0, 255, 0) -- Hijau Neon
	line.Transparency = 1
	lines[player] = line
end

-- Fungsi update garis setiap frame
RunService.RenderStepped:Connect(function()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = player.Character.HumanoidRootPart
			local line = lines[player]

			if not line then
				createLine(player)
				line = lines[player]
			end

			local success1, screenPos1 = pcall(function()
				return Camera:WorldToViewportPoint(LocalPlayer.Character.HumanoidRootPart.Position)
			end)
			local success2, screenPos2 = pcall(function()
				return Camera:WorldToViewportPoint(hrp.Position)
			end)

			if success1 and success2 and screenPos1.Z > 0 and screenPos2.Z > 0 then
				line.From = Vector2.new(screenPos1.X, screenPos1.Y)
				line.To = Vector2.new(screenPos2.X, screenPos2.Y)
				line.Visible = true
			else
				line.Visible = false
			end
		elseif lines[player] then
			lines[player].Visible = false
		end
	end
end)

-- Hapus garis jika player keluar
Players.PlayerRemoving:Connect(function(player)
	if lines[player] then
		lines[player]:Remove()
		lines[player] = nil
	end
end)
