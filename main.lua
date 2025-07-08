local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "STREE HUB | PRRI SCRIPT",
    Icon = 123032091977400,
    LoadingTitle = "SCRIPT Loading...",
    LoadingSubtitle = "made by community: STREE HUB",
    ShowText = "STREE HUB",
    Theme = "Dark",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "STREE HUB",
        FileName = "STREE HUB"
    },

    Discord = {
        Enabled = true,
        Invite = "tTqtKwnGZz", -- Hanya kode undangan, tanpa "https://discord.gg/"
        RememberJoins = true
    },

    KeySystem = true,
    KeySettings = {
        Title = "STREE HUB",
        Subtitle = "STREE HUB Key System",
        Note = "Kunjungi Discord dan WhatsApp kami untuk mendapatkan key",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Free Key", "Free Login", "PRRI TETAP JAYA"}
    }
})

local UniversalTab = Window:CreateTab("Universal Script", "globe-lock", true)
UniversalTab:CreateSection("Cheating Tools")

-- FlyGuiV3 Button
UniversalTab:CreateButton({
    Name = "FlyGuiV3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end,
})

-- Infinite Yield Button
UniversalTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

-- GhostHub Button
UniversalTab:CreateButton({
    Name = "GhostHub",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-GhostHub-16534"))()
    end,
})

-- Super Ring Toggle
UniversalTab:CreateToggle({
    Name = "Super Ring",
    CurrentValue = false,
    Flag = "SuperRingToggle",
    Callback = function(Value)
        if Value then
            -- ON: Aktifkan super ring script
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Kirsiasc/STREE-HUB/main/super_ring_toggle.lua"))()
        else
            -- OFF: Hapus objek SuperRing (jika ada)
            local ring = workspace:FindFirstChild("SuperRing")
            if ring then
                ring:Destroy()
            end
        end
    end,
})

-- Notifikasi
Rayfield:Notify({
    Title = "Follow Akun TikTok",
    Content = "Jangan lupa follow TikTok @kirsia.sc",
    Duration = 3,
    Image = 0
})

Rayfield:Notify({
    Title = "STREE HUB Loaded",
    Content = "Harap tunggu 3 detik karena sedang loading...",
    Duration = 3,
    Image = 4483362458
})

-- Load saved configuration (toggle state, dll.)
Rayfield:LoadConfiguration()
