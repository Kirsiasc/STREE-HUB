STREE-HUB/
├── superring.lua   local Title = Instance.new("TextLabel")                         Title.Size = UDim2.new(1, 0, 0, 40)                          Title.Position = UDim2.new(0, 0, 0, 0)
                           Title.Text = "Super Ring By : kirsiasc"
                           Title.TextColor3 = Color3.fromRGB(0, 0, 0)
                           Title.BackgroundColor3 = Color3.fromRGB(0, 204, 204)
                           Title.Font = Enum.Font.Fondamento
                           Title.TextSize = 22
                           Title.Parent = MainFrame     ← Script utama kamu (isi yang panjang tadi)
└── loader.lua     loadstring(game:HttpGet("https://raw.githubusercontent.com/kirsiasc/STREE-HUB/main/superring.lua"))()     ← Optional (berisi loadstring di atas)
