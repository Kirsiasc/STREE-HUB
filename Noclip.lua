-- STREE HUB | Noclip Bypass for Steal A Brainrot v2025
-- Dibuat oleh kirsiasc | Anti-Opera + Anti-LokalScript Check

if not game:IsLoaded() then game.Loaded:Wait() end

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

-- Player & Character Reference
local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()

local function getCharacter()
	char = lp.Character or lp.CharacterAdded:Wait()
	return char
end

local function disableCollision()
	for _, part in pairs(getCharacter():GetDescendants()) do
		if part:IsA("BasePart") and part.CanCollide == true and part.Name ~= "HumanoidRootPart" then
			part.CanCollide = false
		end
	end
end

-- Toggle system
local noclip = false
local TOGGLE_KEY = Enum.KeyCode.X -- Tekan X untuk aktif/mati

-- Notification (opsional)
local function notify(msg)
	pcall(function()
		game.StarterGui:SetCore("SendNotification", {
			Title = "STREE HUB",
			Text = msg,
			Duration = 3
		})
	end)
end

-- Main loop (stealthy noclip)
RunService.Stepped:Connect(function()
	if noclip then
		pcall(disableCollision)
	end
end)

-- Respawn support
lp.CharacterAdded:Connect(function(c)
	char = c
	wait(1)
	if noclip then
		notify("Noclip Reapplied setelah Respawn")
	end
end)

-- Input toggle
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == TOGGLE_KEY then
		noclip = not noclip
		local state = noclip and "Aktif ✅" or "Nonaktif ❌"
		notify("Noclip: " .. state)
	end
end)
