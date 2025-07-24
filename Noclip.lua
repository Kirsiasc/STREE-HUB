-- STREE HUB | Noclip Bypass v2 for Steal A Brainrot
-- Dibuat oleh kirsiasc | Full Anti-Opera + Anti-Remote + Anti-Lagtrap

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local lp = Players.LocalPlayer

-- Protection flags
local noclip = false
local TOGGLE_KEY = Enum.KeyCode.X
local noclipConnection = nil

-- Utility: Safe Character
local function getCharacter()
	return lp.Character or lp.CharacterAdded:Wait()
end

-- SafeNotify (tidak trigger Opera AntiCoreGui)
local function notify(msg)
	pcall(function()
		game.StarterGui:SetCore("SendNotification", {
			Title = "STREE HUB",
			Text = msg,
			Duration = 3
		})
	end)
end

-- Core Noclip Function (stealth)
local function enableNoclip()
	if noclipConnection then noclipConnection:Disconnect() end
	noclipConnection = RunService.Stepped:Connect(function()
		pcall(function()
			local char = getCharacter()
			for _, part in pairs(char:GetDescendants()) do
				if part:IsA("BasePart") and part.CanCollide == true and part.Name ~= "HumanoidRootPart" then
					part.CanCollide = false
					part.Massless = true
				end
			end
		end)
	end)
end

local function disableNoclip()
	if noclipConnection then
		noclipConnection:Disconnect()
		noclipConnection = nil
	end
end

-- Respawn Handler (autobind ulang)
lp.CharacterAdded:Connect(function()
	wait(1)
	if noclip then
		enableNoclip()
		notify("Noclip Reapplied setelah Respawn ✅")
	end
end)

-- Keyboard Input Handler
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == TOGGLE_KEY then
		noclip = not noclip
		if noclip then
			enableNoclip()
			notify("Noclip Aktif ✅")
		else
			disableNoclip()
			notify("Noclip Dinonaktifkan ❌")
		end
	end
end)

-- Anti-Anti (Hilangkan State Deteksi atau Remote Kick)
pcall(function()
	local oldState = getCharacter():FindFirstChildOfClass("Humanoid"):GetState()
	getCharacter():FindFirstChildOfClass("Humanoid").StateChanged:Connect(function(_, newState)
		if noclip and newState == Enum.HumanoidStateType.FallingDown then
			wait(0.1)
			getCharacter():FindFirstChildOfClass("Humanoid"):ChangeState(oldState)
		end
	end)
end)
