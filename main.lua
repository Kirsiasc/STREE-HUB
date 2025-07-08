-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Buat jendela utama
local Window = Rayfield:CreateWindow({
    Name = "STREE HUB | PRRI SCRIPT",
    Icon = 123032091977400, -- Roblox image ID
    LoadingTitle = "SCRIPT Loading...",
    LoadingSubtitle = "made by community: STREE HUB",
    ShowText = "STREE HUB",
    Theme = "Dark",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "STREE HUB", -- Folder di local file player
        FileName = "STREE HUB"    -- Nama file config
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
        Key = {
            "Free Key",
            "Free Login",
            "PRRI TETAP JAYA"
        }
    }
})

-- Buat tab dan section
local UniversalTab = Window:CreateTab("Universal script", "globe-lock")
local Section = UniversalTab:CreateSection("Cheating")

-- Tombol FlyGuiV3
UniversalTab:CreateButton({
    Name = "FlyGuiV3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end,
})

-- Tombol Infinite Yield
UniversalTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

-- Notifikasi TikTok
Rayfield:Notify({
    Title = "Follow Akun TikTok",
    Content = "Jangan Lupa Follow Akun TikTok @kirsia.sc",
    Duration = 3,
    Image = 0 -- Bisa diganti Roblox image ID
})

-- Notifikasi Load selesai
Rayfield:Notify({
    Title = "STREE HUB Loaded",
    Content = "Harap tunggu 3 detik karena sedang loading...",
    Duration = 3,
    Image = 4483362458 -- Roblox image ID valid
})

-- Load config sebelumnya
Rayfield:LoadConfiguration()
