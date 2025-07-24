-- STREE HUB | ESP NameTag v2 by kirsiasc
-- Warna Hijau Neon, Ukuran Normal

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Fungsi buat NameTag
local function createNameTag(player)
	if player == LocalPlayer then return end

	local function addTag(char)
		local head = char:FindFirstChild("Head")
		if not head then return end

		-- Hapus tag lama
		if head:FindFirstChild("STREE_TAG") then
			head:FindFirstChild("STREE_TAG"):Destroy()
		end

		local tag = Instance.new("BillboardGui")
		tag.Name = "STREE_TAG"
		tag.Adornee = head
		tag.Size = UDim2.new(0, 100, 0, 30)
		tag.StudsOffset = Vector3.new(0, 2.5, 0)
		tag.AlwaysOnTop = true
		tag.Parent = head

		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.Text = player.DisplayName
		label.TextColor3 = Color3.fromRGB(0, 255, 0) -- Warna Hijau Neon
		label.TextStrokeTransparency = 0.4
		label.TextScaled = false
		label.Font = Enum.Font.SourceSans
		label.TextSize = 16 -- Ukuran normal
		label.Parent = tag
	end

	-- Pasang saat spawn
	player.CharacterAdded:Connect(function(char)
		char:WaitForChild("Head", 5)
		addTag(char)
	end)

	-- Kalau sudah spawn duluan
	if player.Character and player.Character:FindFirstChild("Head") then
		addTag(player.Character)
	end
end

-- Tambahkan ke semua pemain
for _, p in ipairs(Players:GetPlayers()) do
	createNameTag(p)
end

-- Tambahkan saat player baru masuk
Players.PlayerAdded:Connect(function(p)
	createNameTag(p)
end)
