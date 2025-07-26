-- STREE HUB | ESP NameTag
-- Ukuran normal, warna hijau neon

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ESPNameTag_Enabled = false
local appliedTags = {}

-- Fungsi untuk memasang name tag
local function attachNameTag(player)
	if player == LocalPlayer then return end

	local function applyTag(char)
		local head = char:FindFirstChild("Head")
		if not head or not ESPNameTag_Enabled then return end

		if head:FindFirstChild("STREE_TAG") then
			head:FindFirstChild("STREE_TAG"):Destroy()
		end

		local tag = Instance.new("BillboardGui")
		tag.Name = "STREE_TAG"
		tag.Adornee = head
		tag.Size = UDim2.new(0, 100, 0, 20)
		tag.StudsOffset = Vector3.new(0, 2.5, 0)
		tag.AlwaysOnTop = true
		tag.Parent = head

		local text = Instance.new("TextLabel")
		text.Size = UDim2.new(1, 0, 1, 0)
		text.BackgroundTransparency = 1
		text.Text = player.DisplayName
		text.TextColor3 = Color3.fromRGB(0, 255, 0)
		text.TextStrokeTransparency = 0.3
		text.Font = Enum.Font.SourceSans
		text.TextScaled = false
		text.TextSize = 14
		text.Parent = tag

		appliedTags[player] = tag
	end

	player.CharacterAdded:Connect(function(char)
		char:WaitForChild("Head", 5)
		applyTag(char)
	end)

	if player.Character and player.Character:FindFirstChild("Head") then
		applyTag(player.Character)
	end
end

-- Tambahkan toggle ke VisualTab OrionLib
VisualTab:AddToggle({
	Name = "ESP NameTag",
	Default = false,
	Callback = function(state)
		ESPNameTag_Enabled = state

		if state then
			-- Pasang ke semua player yang ada
			for _, p in ipairs(Players:GetPlayers()) do
				attachNameTag(p)
			end

			-- Pasang juga jika ada player baru
			Players.PlayerAdded:Connect(function(p)
				attachNameTag(p)
			end)
		else
			-- Hapus semua tag
			for _, p in ipairs(Players:GetPlayers()) do
				if p.Character and p.Character:FindFirstChild("Head") then
					local head = p.Character:FindFirstChild("Head")
					if head:FindFirstChild("STREE_TAG") then
						head:FindFirstChild("STREE_TAG"):Destroy()
					end
				end
			end
		end
	end
})
