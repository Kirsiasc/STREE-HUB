-- STREE HUB | AntiStun + AutoRespawn v3
-- Game: Steal A Brainrot | Dibuat oleh kirsiasc
-- Final Bypass Sistem 2025

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local plr = Players.LocalPlayer

-- Konfigurasi fitur
local UNLOCKED = true
local SETTINGS = {
    AntiStun = true,
    AutoRespawn = true
}

-- Proteksi modul internal yang menyisipkan efek "Stunned"
local function antiRemoteProtector()
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "table" and rawget(v, "Stunned") then
            pcall(function() v.Stunned = false end)
        end
    end
end

-- Deteksi mati dan respawn otomatis
plr.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid")

    if SETTINGS.AutoRespawn then
        char:FindFirstChildOfClass("Humanoid").Died:Connect(function()
            task.spawn(function()
                repeat
                    firetouchinterest(workspace:FindFirstChild("SpawnLocation") or workspace:FindFirstChildWhichIsA("SpawnLocation"), plr.Character:FindFirstChild("HumanoidRootPart"), 0)
                    task.wait(1)
                until plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0
            end)
        end)
    end
end)

-- Jalankan loop AntiStun
RunService.RenderStepped:Connect(function()
    if UNLOCKED and SETTINGS.AntiStun and plr.Character then
        local char = plr.Character

        local rag = char:FindFirstChild("Ragdoll")
        if rag then pcall(function() rag:Destroy() end) end

        local stunned = char:FindFirstChild("Stunned")
        if stunned then pcall(function() stunned:Destroy() end) end

        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.PlatformStand then
            pcall(function() hum.PlatformStand = false end)
        end

        antiRemoteProtector()
    end
end)
