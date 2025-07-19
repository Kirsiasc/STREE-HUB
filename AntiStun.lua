run.RenderStepped:Connect(function()
    if UNLOCKED and SETTINGS.AntiStun and plr.Character then
        local char = plr.Character
        if char:FindFirstChild("Ragdoll") then char:FindFirstChild("Ragdoll"):Destroy() end
        if char:FindFirstChild("Stunned") then char:FindFirstChild("Stunned"):Destroy() end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum.PlatformStand = false end
    end
end)
