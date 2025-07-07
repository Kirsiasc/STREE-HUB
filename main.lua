Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "STREE HUB | PRRI SCRIPT",
   Icon = 101447877507131,
   LoadingTitle = "SCRIPT Loading...",
   LoadingSubtitle = "made by community: STREE HUB",
   ShowText = "STREE HUB",
   Theme = "DarkGreen",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "STREE HUB",
      FileName = "STREE HUB"
   },

   Discord = {
      Enabled = true,
      Invite = "jdmX43t5mY", -- Hanya kode undangan
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

-- Home Tab
local MainTab = Window:CreateTab("Home", "house")
MainTab:CreateSection("channel")

MainTab:CreateButton({
   Name = "Discord",
   Callback = function()
       setclipboard("https://discord.gg/tTqtKwnGZz")
       Rayfield:Notify({ Title = "Link Disalin", Content = "Link Discord telah disalin ke clipboard.", Duration = 3 })
   end,
})

MainTab:CreateButton({
   Name = "Channel",
   Callback = function()
       setclipboard("https://whatsapp.com/channel/0029VbAwRihKAwEtwyowt62N")
       Rayfield:Notify({ Title = "Link Disalin", Content = "Link Channel telah disalin ke clipboard.", Duration = 3 })
   end,
})

-- Universal Script Tab
local UniversalTab = Window:CreateTab("Game Script", "earth")
UniversalTab:CreateSection("Cheatting")

UniversalTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "ToggleFly",
   Callback = function(state)
       loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Fly.txt"))()
   end,
})

UniversalTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {15, 150},
   Increment = 5,
   Suffix = "WS",
   CurrentValue = 16,
   Flag = "WalkSpeedSlider",
   Callback = function(V)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V
   end,
})

UniversalTab:CreateSlider({
   Name = "JumpPower",
   Range = {15, 150},
   Increment = 5,
   Suffix = "JP",
   CurrentValue = 50,
   Flag = "JumpPowerSlider",
   Callback = function(V)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = V
   end,
})

-- ESP Tab
local ESPTab = Window:CreateTab("ESP", "eye")
ESPTab:CreateButton({
   Name = "ESP",
   Callback = function()
       loadstring(game:HttpGet("https://pastefy.app/AoZzV4ct/raw"))()
   end,
})

-- AimBot Tab
local AimBotTab = Window:CreateTab("AimBot", "crosshair")
AimBotTab:CreateButton({
   Name = "AimBot",
   Callback = function()
       loadstring(game:HttpGet("https://pastefy.app/ZZZPEYZQ/raw"))()
   end,
})

-- Notify
Rayfield:Notify({
   Title = "STREE HUB Loaded",
   Content = "Harap tunggu 3 detik karena sedang loading...",
   Duration = 3,
   Image = 4483362458 -- Contoh image ID (harus berupa Roblox image ID)
})

Rayfield:LoadConfiguration()
