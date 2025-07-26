-- STREE HUB | Infinite Jump Fixed for "Steal A Brainrot"
-- Dibuat oleh kirsiasc - 2025

if not game:IsLoaded() then game.Loaded:Wait() end

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local lp = Players.LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")

-- Auto update character
lp.CharacterAdded:Connect(function(c)
	char = c
	hum = c:WaitForChild("Humanoid")
end)

-- Status Toggle
local InfiniteJumpEnabled = false

-- Infinite Jump Logic
UserInputService.JumpRequest:Connect(function()
	if InfiniteJumpEnabled and lp.Character and hum and hum:GetState() ~= Enum.HumanoidStateType.Seated then
		local root = char:FindFirstChild("HumanoidRootPart")
		if root then
			root.Velocity = Vector3.new(0, 50, 0)
			hum:ChangeState(Enum.HumanoidStateType.Freefall)
		end
	end
end)

-- Pastikan Jumping dan Freefall tidak dinonaktifkan
RunService.Stepped:Connect(function()
	if InfiniteJumpEnabled and hum then
		pcall(function()
			hum:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			hum:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
		end)
	end
end)

-- Tambahkan Toggle OrionLib
GameplayTab:AddToggle({
	Name = "Infinite Jump (Anti SAB)",
	Default = false,
	Callback = function(state)
		InfiniteJumpEnabled = state
		if state then
			pcall(function()
				game.StarterGui:SetCore("SendNotification", {
					Title = "STREE HUB",
					Text = "Infinite Jump Aktif",
					Duration = 4
				})
			end)
		else
			pcall(function()
				game.StarterGui:SetCore("SendNotification", {
					Title = "STREE HUB",
					Text = "Infinite Jump Nonaktif",
					Duration = 4
				})
			end)
		end
	end
})
