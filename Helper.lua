local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- Tujuan (safe zone)
local SafePos = Vector3.new(-4518, 175, -1021) -- Ganti sesuai lokasi aman

-- Tween Info
local TweenTime = 3 -- Detik waktu perpindahan
local TweenInfo = TweenInfo.new(TweenTime, Enum.EasingStyle.Linear)

-- Buat Tween
local Tween = TweenService:Create(HRP, TweenInfo, {CFrame = CFrame.new(SafePos)})
Tween:Play()
