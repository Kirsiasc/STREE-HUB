local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Main Window Configuration
local Window = Rayfield:CreateWindow({
    Name = "STREE HUB | PRRI SCRIPT",
    Icon = 123032091977400,
    LoadingTitle = "Loading STREE HUB...",
    LoadingSubtitle = "Made by Community: STREE HUB",
    ShowText = "STREE HUB",
    Theme = "Ocean",

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "STREE HUB",
        FileName = "STREE HUB Config"
    },

    Discord = {
        Enabled = true,
        Invite = "tTqtKwnGZz",
        RememberJoins = true
    },

    KeySystem = true,
    KeySettings = {
        Title = "STREE HUB",
        Subtitle = "Key System",
        Note = "Visit our Discord for the key",
        FileName = "STREE_HUB_Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Free Key", "Free Login", "PRRI TETAP JAYA"}
    }
})

-- Universal Scripts Tab
local UniversalTab = Window:CreateTab("Universal Scripts", 123032091977400)
local CheatingSection = UniversalTab:CreateSection("Cheating Tools")

-- Fly GUI V3 Button
UniversalTab:CreateButton({
    Name = "Fly GUI V3",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading",
            Content = "Loading Fly GUI V3...",
            Duration = 3,
            Image = 4483362458
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end,
})

-- Super Ring Toggle
local SuperRingEnabled = false
UniversalTab:CreateToggle({
    Name = "Super Ring",
    CurrentValue = SuperRingEnabled,
    Flag = "SuperRingToggle",
    Callback = function(Value)
        SuperRingEnabled = Value
        if Value then
            Rayfield:Notify({
                Title = "Super Ring",
                Content = "Activating Super Ring...",
                Duration = 3,
                Image = 4483362458
            })
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Kirsiasc/STREE-HUB/main/super_ring_toggle.lua"))()
        else
            Rayfield:Notify({
                Title = "Super Ring",
                Content = "Deactivating Super Ring...",
                Duration = 3,
                Image = 4483362458
            })
            local ring = workspace:FindFirstChild("SuperRing")
            if ring then
                ring:Destroy()
            end
        end
    end,
})

-- Popular Scripts Tab
local PopularTab = Window:CreateTab("Popular Scripts", 123032091977400)
local PopularSection = PopularTab:CreateSection("Famous Scripts")

-- Infinite Yield Button
PopularTab:CreateButton({
    Name = "Infinite Yield Admin",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading",
            Content = "Loading Infinite Yield...",
            Duration = 3,
            Image = 4483362458
        })
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

-- GhostHub Button
PopularTab:CreateButton({
    Name = "GhostHub Universal Script",
    Callback = function()
        Rayfield:Notify({
            Title = "Loading",
            Content = "Loading GhostHub...",
            Duration = 3,
            Image = 4483362458
        })
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-GhostHub-16534"))()
    end,
})

-- Initial Notifications
task.wait(1)
Rayfield:Notify({
    Title = "STREE HUB Loaded",
    Content = "Welcome to STREE HUB!",
    Duration = 5,
    Image = 4483362458,
    Actions = {
        Ignore = {
            Name = "Continue",
            Callback = function()
                print("User continued to STREE HUB")
            end
        }
    }
})

task.wait(2)
Rayfield:Notify({
    Title = "Follow Us",
    Content = "Don't forget to follow @kirsia.sc on TikTok",
    Duration = 5,
    Image = 4483362458
})

-- Load Configuration
Rayfield:LoadConfiguration()
