for _, v in pairs(game:GetDescendants()) do
    if v:IsA("Texture") or v:IsA("Decal") then
        v:Destroy()
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v:Destroy()
    elseif v:IsA("Shirt") or v:IsA("Pants") then
        v:Destroy()
    elseif v:IsA("SurfaceAppearance") or v:IsA("SpecialMesh") then
        v:Destroy()
    end
end

-- Reduce Lighting Quality
local lighting = game:GetService("Lighting")
lighting.GlobalShadows = false
lighting.FogEnd = 100000
lighting.Brightness = 1

-- Turn off terrain decoration
if workspace:FindFirstChildOfClass("Terrain") then
    workspace:FindFirstChildOfClass("Terrain").Decoration = false
end

-- FPS Boost Notification
game.StarterGui:SetCore("SendNotification", {
    Title = "Anti Lag Activated",
    Text = "Semua efek visual dihapus untuk meningkatkan FPS.",
    Duration = 5
})
