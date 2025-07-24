-- STREE HUB | Noclip Bypass v2 for Steal A Brainrot
-- Dibuat oleh kirsiasc | Full Anti-Opera + Anti-Remote + Anti-Lagtrap

if not game:IsLoaded() then game.Loaded:Wait() end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local lp = Players.LocalPlayer

local noclip = false

-- Tambahan: Proteksi terhadap anti-remote/modul scanning
local function protect(part)
	pcall(function()
		part.CanCollide = false
		part.Massless = true
		part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0)
	end)
end

-- Toggle Noclip dengan tombol N
UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.N then
		noclip = not noclip
		warn("[STREE HUB] Noclip: " .. (noclip and "Aktif" or "Nonaktif"))
	end
end)

-- Noclip Handler Loop
RunService.Stepped:Connect(function()
	if noclip and lp.Character then
		for _, v in ipairs(lp.Character:GetDescendants()) do
			if v:IsA("BasePart") and v.CanCollide then
				protect(v)
			end
		end
	end
end)

-- Auto load jika karakter mati
lp.CharacterAdded:Connect(function(char)
	repeat task.wait() until char:FindFirstChild("HumanoidRootPart")
	if noclip then
		for _, v in ipairs(char:GetDescendants()) do
			if v:IsA("BasePart") then
				protect(v)
			end
		end
	end
end)
