-- STREE HUB | Noclip Bypass v3 - Final Version
-- Game: Steal A Brainrot | Dibuat oleh kirsiasc
-- Fitur: Auto Noclip, Anti-Remote, Anti-Opera, Anti-PhysicsScan

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local lp = Players.LocalPlayer

local function safeNoclip(part)
	pcall(function()
		part.CanCollide = false
		if not part.Anchored then
			part.Massless = true
		end
		part:SetAttribute("STREE_PROTECTED", true)
	end)
end

local function handleCharacter(char)
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then
			safeNoclip(part)
		end
	end

	-- Proteksi ulang tiap 0.2 detik
	task.spawn(function()
		while task.wait(0.2) do
			if not lp.Character or lp.Character ~= char then break end
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") and part:GetAttribute("STREE_PROTECTED") ~= true then
					safeNoclip(part)
				end
			end
		end
	end)
end

-- Apply noclip ke karakter saat ini
if lp.Character then
	handleCharacter(lp.Character)
end

-- Noclip tiap respawn
lp.CharacterAdded:Connect(function(char)
	char:WaitForChild("HumanoidRootPart")
	handleCharacter(char)
end)

-- Loop force disable collide (Real-time)
RunService.Stepped:Connect(function()
	local char = lp.Character
	if char then
		for _, part in ipairs(char:GetDescendants()) do
			if part:IsA("BasePart") and part.CanCollide and not part.Anchored then
				part.CanCollide = false
			end
		end
	end
end)

-- Notifikasi sukses
StarterGui:SetCore("SendNotification", {
	Title = "STREE HUB",
	Text = "Noclip Bypass v3 Aktif ✔️",
	Duration = 3
})
