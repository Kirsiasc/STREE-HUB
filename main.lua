Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "STREE HUB | PRRI SCRIPT",
   Icon = 101447877507131,
   LoadingTitle = "SCRIPT Loading...",
   LoadingSubtitle = "made by community: STREE HUB",
   ShowText = "STREE",
   Theme = "Green",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "STREE HUB",
      FileName = "STREE Hub"
   },

   Discord = {
      Enabled = true,
      Invite = "jdmX43t5mY",
      RememberJoins = true
   },

   KeySystem = true,
   KeySettings = {
      Title = "STREE HUB",
      Subtitle = "STREE HUB Key System",
      Note = "Join Discord dan WhatsApp untuk dapatkan key",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Free Key", "Free Login","PPRI TETAP JAYA"}
   }
})

-- HOME TAB
local HomeTab = Window:CreateTab("Home", "house")
local Section1 = HomeTab:CreateSection("Channel")

HomeTab:CreateButton({
   Name = "Discord",
   Callback = function()
       setclipboard("https://discord.gg/tTqtKwnGZz")
       Rayfield:Notify({ Title = "Copied", Content = "Discord link copied!", Duration = 2 })
   end,
})

HomeTab:CreateButton({
   Name = "Channel WhatsApp",
   Callback = function()
       setclipboard("https://whatsapp.com/channel/0029VbAwRihKAwEtwyowt62N")
       Rayfield:Notify({ Title = "Copied", Content = "WhatsApp link copied!", Duration = 2 })
   end,
})

-- GAME SCRIPT TAB
local ScriptTab = Window:CreateTab("Game Script", "earth")
local Section2 = ScriptTab:CreateSection("Cheating")

ScriptTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "FlyToggle",
   Callback = function(Fly)
       loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Fly.txt"))()
   end,
})

ScriptTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {15, 150},
   Increment = 10,
   Suffix = "WS",
   CurrentValue = 10,
   Flag = "WalkSpeedSlider",
   Callback = function(V)
       game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V
   end,
})

ScriptTab:CreateSlider({
   Name = "JumpPower",
   Range = {15, 150},
   Increment = 10,
   Suffix = "JP",
   CurrentValue = 10,
   Flag = "JumpPowerSlider",
   Callback = function(V)
       game.Players.LocalPlayer.Character.Humanoid.JumpPower = V
   end,
})

-- ESP TAB
local ESPTab = Window:CreateTab("ESP", "eye")
ESPTab:CreateButton({
   Name = "ESP Script",
   Callback = function()
       loadstring(game:HttpGet("https://pastefy.app/AoZzV4ct/raw"))()
   end,
})

-- AIMBOT TAB
local AimbotTab = Window:CreateTab("AimBot", "crosshair")
AimbotTab:CreateButton({
   Name = "AimBot Script",
   Callback = function()
       loadstring(game:HttpGet("https://pastefy.app/ZZZPEYZQ/raw"))()
   end,
})

-- NOTIFY
Rayfield:Notify({
   Title = "STREE HUB Loaded",
   Content = "Harap tunggu 3 detik karena sedang Loading...",
   Duration = 3,
   Image = "check",
})

-- LOAD CONFIG
Rayfield:LoadConfiguration()

