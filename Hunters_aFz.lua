if not game:IsLoaded() then game.Loaded:Wait() end
local Players, UIS, RunSvc, TweenSvc = game:GetService("Players"), game:GetService("UserInputService"), game:GetService("RunService"), game:GetService("TweenService")
local player, camera = Players.LocalPlayer, workspace.CurrentCamera
local neonGreen, pureBlack = Color3.fromRGB(0, 255, 127), Color3.fromRGB(0, 0, 0)
local correctKey, toggleKey = "PRRI TETAP JAYA", Enum.KeyCode.Insert
local root, hum = player.Character and player.Character:WaitForChild("HumanoidRootPart"), player.Character and player.Character:WaitForChild("Humanoid")

local function updateRoot()
	root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	hum = player.Character and player.Character:WaitForChild("Humanoid")
end
player.CharacterAdded:Connect(updateRoot)

-- ========== KEY SYSTEM ==========
local keyGui = Instance.new("ScreenGui", game.CoreGui)
local kF = Instance.new("Frame", keyGui)
kF.Size, kF.Position, kF.AnchorPoint = UDim2.new(0, 320, 0, 180), UDim2.new(0.5, 0, 0.5, 0), Vector2.new(0.5, 0.5)
kF.BackgroundColor3, kF.BackgroundTransparency, kF.BorderSizePixel = pureBlack, 0.7, 0
Instance.new("UICorner", kF).CornerRadius = UDim.new(0, 8)
Instance.new("UIStroke", kF).Color, Instance.new("UIStroke", kF).Thickness = neonGreen, 2

local kLabel = Instance.new("TextLabel", kF)
kLabel.Size, kLabel.Position, kLabel.BackgroundTransparency = UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, 10), 1
kLabel.Text, kLabel.TextColor3, kLabel.Font, kLabel.TextSize = "Enter Key:", neonGreen, Enum.Font.SourceSansBold, 18

local kBox = Instance.new("TextBox", kF)
kBox.Size, kBox.Position, kBox.BackgroundTransparency = UDim2.new(1, -20, 0, 40), UDim2.new(0, 10, 0, 55), 0.7
kBox.BackgroundColor3, kBox.TextColor3, kBox.Font, kBox.TextSize, kBox.PlaceholderText = pureBlack, neonGreen, Enum.Font.SourceSans, 16, "Key..."

local kBtn = Instance.new("TextButton", kF)
kBtn.Size, kBtn.Position, kBtn.BackgroundTransparency = UDim2.new(0, 100, 0, 35), UDim2.new(0.5, -50, 0, 110), 0.7
kBtn.BackgroundColor3, kBtn.TextColor3, kBtn.Font, kBtn.TextSize, kBtn.Text = pureBlack, neonGreen, Enum.Font.SourceSansBold, 16, "Submit"
Instance.new("UICorner", kBtn).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", kBtn).Color, Instance.new("UIStroke", kBtn).Thickness = neonGreen, 2

-- ========== MAIN UI FUNCTION ==========
local function loadMain()
	local mainGui = Instance.new("ScreenGui", game.CoreGui)
	local mF = Instance.new("Frame", mainGui)
	mF.Size, mF.Position, mF.AnchorPoint = UDim2.new(0, 260, 0, 400), UDim2.new(0.5, 0, 0.5, 0), Vector2.new(0.5, 0.5)
	mF.BackgroundColor3, mF.BackgroundTransparency, mF.BorderSizePixel = pureBlack, 0.7, 0
	mF.Active, mF.Draggable = true, true
	Instance.new("UICorner", mF).CornerRadius = UDim.new(0, 8)
	Instance.new("UIStroke", mF).Color, Instance.new("UIStroke", mF).Thickness = neonGreen, 2

	local title = Instance.new("TextLabel", mF)
	title.Size, title.BackgroundTransparency = UDim2.new(1, 0, 0, 25), 1
	title.Text, title.TextColor3, title.Font, title.TextSize = "STREE HUB | PRRI SCRIPT", neonGreen, Enum.Font.SourceSansBold, 18

	local closeBtn = Instance.new("TextButton", mF)
	closeBtn.Size, closeBtn.Position, closeBtn.BackgroundTransparency = UDim2.new(0, 20, 0, 20), UDim2.new(1, -25, 0, 5), 0.7
	closeBtn.BackgroundColor3, closeBtn.TextColor3, closeBtn.Text, closeBtn.Font, closeBtn.TextSize = pureBlack, neonGreen, "X", Enum.Font.SourceSansBold, 14
	Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
	Instance.new("UIStroke", closeBtn).Color, Instance.new("UIStroke", closeBtn).Thickness = neonGreen, 2
	closeBtn.MouseButton1Click:Connect(function() mainGui.Enabled = false end)

	-- Logo Image
	local logo = Instance.new("ImageLabel", mainGui)
	logo.Size = UDim2.new(0, 130, 0, 130)
	logo.Position = UDim2.new(1, -140, 0, 10)
	logo.BackgroundTransparency, logo.ImageTransparency = 1, 0
	logo.Image = "rbxassetid://**PLACE_YOUR_IMAGE_ID_HERE**"

	-- ESP, Buttons, Toggles (Paste dari script kamu sebelumnya)
	-- [TRUNCATED: gunakan blok script ESP dan fitur seperti Super Ring, Fly, Noclip, Speed seperti sebelumnya]

	-- Insert key toggle
	UIS.InputBegan:Connect(function(inp, gpe)
		if not gpe and inp.KeyCode == toggleKey then
			mainGui.Enabled = not mainGui.Enabled
		end
	end)
end

-- Submit tombol key
kBtn.MouseButton1Click:Connect(function()
	if kBox.Text == correctKey then
		keyGui:Destroy()
		loadMain()
	else
		kBox.Text = "INVALID!"
	end
end)
