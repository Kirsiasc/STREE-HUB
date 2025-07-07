local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "STREE HUB | PRRI SCRIPT",
    Icon = 123032091977400, -- Ganti dengan ID ikon Roblox jika ingin tampil di UI
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
        Invite = "jdmX43t5mY", -- Hanya kode, tanpa "discord.gg/"
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

-- TAB Universal
local UniversalTab = Window:CreateTab("Universal script", "globe-lock")
local Section = UniversalTab:CreateSection("Cheating")

-- Tombol FlyGuiV3
UniversalTab:CreateButton({
    Name = "FlyGuiV3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end,
})

-- Notifikasi TikTok
Rayfield:Notify({
    Title = "Follow Akun TikTok",
    Content = "Jangan Lupa Follow Akun TikTok @kirsia.sx",
    Duration = 3,
    Image = 0
})

-- Notifikasi Script Loaded
Rayfield:Notify({
    Title = "STREE HUB Loaded",
    Content = "Harap tunggu 3 detik karena sedang loading...",
    Duration = 3,
    Image = 4483362458
})

-- Load Konfigurasi
Rayfield:LoadConfiguration() 
