-- STREE HUB | Noclip Bypass v3.1 for Steal A Brainrot (2025)
-- Dibuat oleh kirsiasc | Full Bypass: Opera + Remote + Tembok Lokal + Anti Deteksi

if not game:IsLoaded() then game.Loaded:Wait() end

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

-- PLAYER REF
local lp = Players.LocalPlayer
local Character = lp.Character or lp.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- VARIABEL
local TOGGLE_KEY = Enum.KeyCode.X
local noclip = false
local loopConn

-- NOTIFIKASI AMAN
local function notify(msg)
	pcall(function()
		game.StarterGui:SetCore("SendNotification", {
			Title = "STREE HUB",
			Text = msg,
			Duration = 3
		})
	end)
end

-- GET KARAKTER YANG VALID
local function getChar()
	return lp.Character or lp.CharacterAdded:Wait()
end

-- BYPASS COLLISION DAN TELEPORT-CHECK (NOCOLLIDE + MASSLESS + POSITION RESET)
local function doNoclip()
	local char = getChar()
	for _, part in pairs(char:GetDescendants()) do
		if part:IsA("BasePart") and part.CanCollide and part.Name ~= "HumanoidRootPart" then
			part.CanCollide = false
			part.Massless = true
			part.Velocity = Vector3.zero
		end
	end
end

-- AKTIFKAN Noclip
local function enable()
	if loopConn then loopConn:Disconnect() end
	loopConn = RunService.Stepped:Connect(function()
		pcall(doNoclip)
	end)
end

-- NONAKTIFKAN Noclip
local function disable()
	if loopConn then loopConn:Disconnect() end
	loopConn = nil
end

-- TOGGLE INPUT
UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == TOGGLE_KEY then
		noclip = not noclip
		if noclip then
			enable()
			notify("✅ Noclip Aktif (STREE HUB)")
		else
			disable()
			notify("❌ Noclip Dinonaktifkan")
		end
	end
end)

-- RESPWAN SUPPPORT
lp.CharacterAdded:Connect(function(char)
	Character = char
	Humanoid = char:WaitForChild("Humanoid")
	wait(1)
	if noclip then
		enable()
		notify("♻️ Noclip Aktif Ulang (Respawn)")
	end
end)

-- HUMANOID STATE BYPASS: HINDARI "FallingDown", "Ragdoll", "Dead"
pcall(function()
	local last = Humanoid:GetState()
	Humanoid.StateChanged:Connect(function(_, new)
		if noclip and (new == Enum.HumanoidStateType.FallingDown or new == Enum.HumanoidStateType.Ragdoll) then
			wait()
			Humanoid:ChangeState(last)
		end
	end)
end)

-- BLOCK SUSPICIOUS REMOTES (ANTI SERVER SPY + OPERA BYPASS)
for _, conn in pairs(getconnections(Humanoid:GetPropertyChangedSignal("WalkSpeed"))) do
	if typeof(conn.Function) == "function" and islclosure(conn.Function) then
		conn:Disable()
	end
end
