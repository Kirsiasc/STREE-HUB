local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Buatkan tag di atas kepala
local function createNameTag(player)
	if player == LocalPlayer then return end
	if not player.Character then return end
	if player.Character:FindFirstChild("NameTag") then return end

	local head = player.Character:FindFirstChild("Head")
	if not head then return end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "NameTag"
	billboard.Adornee = head
	billboard.Size = UDim2.new(0, 200, 0, 50)
	billboard.StudsOffset = Vector3.new(0, 2, 0)
	billboard.AlwaysOnTop = true

	local textLabel = Instance.new("TextLabel", billboard)
	textLabel.Size = UDim2.new(1, 0, 1, 0)
	textLabel.BackgroundTransparency = 1
	textLabel.Text = player.DisplayName
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
	textLabel.TextStrokeTransparency = 0
	textLabel.TextScaled = true
	textLabel.Font = Enum.Font.SourceSansBold

	billboard.Parent = head
end

-- Loop untuk memasang ESP ke semua player
RunService.RenderStepped:Connect(function()
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			createNameTag(player)
		end
	end
end)
