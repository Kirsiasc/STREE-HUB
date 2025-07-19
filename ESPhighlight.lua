local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Fungsi untuk memberi highlight ke karakter
local function addHighlight(character)
    if not character or character == LocalPlayer.Character then return end
    if not character:FindFirstChild("HumanoidRootPart") then return end
    if character:FindFirstChild("Highlight") then return end

    local highlight = Instance.new("Highlight")
    highlight.Name = "Highlight"
    highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Merah
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.OutlineTransparency = 0
    highlight.Parent = character
end

-- Loop untuk terus memberi highlight ke semua pemain kecuali LocalPlayer
RunService.RenderStepped:Connect(function()
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            addHighlight(player.Character)
        end
    end
end)
