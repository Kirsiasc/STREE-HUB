local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Super Ring Hub",
    LoadingTitle = "Loading Super Ring...",
    LoadingSubtitle = "by Kirsia",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local Tab = Window:CreateTab("Main", 123456, true) -- Ganti icon jika ingin

local Toggle = Tab:CreateToggle({
    Name = "Super Ring Toggle",
    CurrentValue = false,
    Flag = "SuperRingToggle",
    Callback = function(Value)
        if Value then
            print("✅ Super Ring Diaktifkan!")
            -- Tambahkan efek atau fitur Super Ring di sini
            -- Contoh efek:
            local ring = Instance.new("Part", game.Workspace)
            ring.Shape = Enum.PartType.Ball
            ring.Color = Color3.fromRGB(255, 223, 0)
            ring.Material = Enum.Material.Neon
            ring.Size = Vector3.new(5, 5, 5)
            ring.Anchored = true
            ring.Name = "SuperRing"
            ring.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
        else
            print("❌ Super Ring Dimatikan!")
            -- Hapus efek Super Ring
            local existingRing = game.Workspace:FindFirstChild("SuperRing")
            if existingRing then
                existingRing:Destroy()
            end
        end
    end,
})
