local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "STREE HUB",
    Icon = "earth", -- Use Lucide icon name as a string, or use image ID number
    LoadingTitle = "STREE LOADING",
    LoadingSubtitle = "Made by: Kirsia",
    Theme = "DarkBlue",

    ToggleUIKeybind = "K",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "STREE",
        FileName = "STREE HUB"
    },

    Discord = {
        Enabled = true,
        Invite = "MFzWcQNA",
        RememberJoins = true
    },

    KeySystem = true,
    KeySettings = {
        Title = "STREE HUB",
        Subtitle = "STREE Key System",
        Note = "Get the key from our Discord: https://discord.gg/tTqtKwnGZz",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Free Key", "Free login"}
    }
})

local UniversalTab = Window:CreateTab("Universal Scripts", "globe-lock")
UniversalTab:CreateSection("Cheats")

UniversalTab:CreateButton({
    Name = "Farm Bond",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/qE3kiwX4/raw"))()
    end,
})

UniversalTab:CreateButton({
    Name = "Auto Win",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/sBQRgxba/raw"))()
    end,
})

UniversalTab:CreateButton({
    Name = "WalkSpeed",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/QvT5KWcH/raw"))()
    end,
})

UniversalTab:CreateButton({
    Name = "Jump Power",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/mWz3tpuy/raw"))()
    end,
})

local GameTab = Window:CreateTab("Game Scripts", "gamepad-2")
GameTab:CreateSection("Popular Scripts")

GameTab:CreateButton({
    Name = "Thand Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thiennrb7/Script/main/autobond"))()
    end,
})

GameTab:CreateButton({
    Name = "Null Fire",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/JonasThePogi/DeadRails/main/newloadstring"))()
    end,
})

Rayfield:Notify({
    Title = "STREE LOADING",
    Content = "All scripts successfully loaded!",
    Duration = 3,
    Image = "Check",
})

Rayfield:LoadConfiguration()
