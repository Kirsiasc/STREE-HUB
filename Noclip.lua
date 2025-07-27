-- STREE HUB Noclip Script Bypass [Steal A Brainrot]
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

_G.STREE_NOCLIP = _G.STREE_NOCLIP or false

-- Fungsi utama noclip
local function EnableNoclip()
    local connection
    connection = RunService.Stepped:Connect(function()
        if not _G.STREE_NOCLIP then
            if connection then connection:Disconnect() end
            return
        end

        Character = LocalPlayer.Character
        if Character then
            for _, part in ipairs(Character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide == true then
                    part.CanCollide = false
                end
            end
        end
    end)
end

-- Patch terhadap sistem operasi/anti noclip
local function PatchAntiNoclip()
    -- Coba cegah remote log basic
    for _, v in pairs(getgc(true)) do
        if typeof(v) == "function" and islclosure(v) then
            local info = debug.getinfo(v)
            if info and info.name and string.find(info.name:lower(), "noclip") then
                hookfunction(v, function(...) return nil end)
            end
        end
    end

    -- Coba block remote event spam
    local remotes = {"NoclipDetected", "CheatDetected", "ViolationReport", "ServerLog"}
    for _, name in ipairs(remotes) do
        local remote = game:GetService("ReplicatedStorage"):FindFirstChild(name)
        if remote and remote:IsA("RemoteEvent") then
            remote:Destroy()
        end
    end
end

-- Eksekusi
if _G.STREE_NOCLIP then
    PatchAntiNoclip()
    EnableNoclip()
end

--Notification sukses
StarterGui:SetCore("SendNotification", {
	Title = "STREE HUB",
	Text = "Noclip [Bypass] Aktif ✔️",
	Duration = 3
})
