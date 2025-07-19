-- NativeHub TRANSPARENT NEON | STREE HUB
-- Key: PRRI TETAP JAYA
-- Insert = Re-open UI | X = Close UI
-- Transparansi 50 % + Stroke hijau neon solid

if not game:IsLoaded() then game.Loaded:Wait() end
local Players = game:GetService("Players")
local UIS     = game:GetService("UserInputService")
local RunSvc  = game:GetService("RunService")
local player  = Players.LocalPlayer
local camera  = workspace.CurrentCamera

local correctKey   = "PRRI TETAP JAYA"
local toggleKey    = Enum.KeyCode.Insert
local neonGreen    = Color3.fromRGB(0, 255, 127)
local pureBlack    = Color3.fromRGB(0, 0, 0)

-- ========= KEY SYSTEM =========
local keyGui = Instance.new("ScreenGui", game.CoreGui)
keyGui.Name = "KeyGui"
keyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local keyFrame = Instance.new("Frame", keyGui)
keyFrame.Size = UDim2.new(0, 320, 0, 180)
keyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
keyFrame.BackgroundColor3 = pureBlack
keyFrame.BackgroundTransparency = 0.5
keyFrame.BorderSizePixel = 0
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 8)
local ks = Instance.new("UIStroke", keyFrame)
ks.Color = neonGreen
ks.Thickness = 2

local keyLabel = Instance.new("TextLabel", keyFrame)
keyLabel.Size = UDim2.new(1, -20, 0, 40)
keyLabel.Position = UDim2.new(0, 10, 0, 10)
keyLabel.BackgroundTransparency = 1
keyLabel.Text = "Enter Key:"
keyLabel.TextColor3 = neonGreen
keyLabel.Font = Enum.Font.SourceSansBold
keyLabel.TextSize = 18

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(1, -20, 0, 40)
keyBox.Position = UDim2.new(0, 10, 0, 55)
keyBox.BackgroundColor3 = pureBlack
keyBox.BackgroundTransparency = 0.5
keyBox.TextColor3 = neonGreen
keyBox.Font = Enum.Font.SourceSans
keyBox.TextSize = 16
keyBox.PlaceholderText = "Key..."
keyBox.ClearTextOnFocus = false

local keyBtn = Instance.new("TextButton", keyFrame)
keyBtn.Size = UDim2.new(0, 100, 0, 35)
keyBtn.Position = UDim2.new(0.5, -50, 0, 110)
keyBtn.BackgroundColor3 = pureBlack
keyBtn.BackgroundTransparency = 0.5
keyBtn.Text = "Submit"
keyBtn.Font = Enum.Font.SourceSansBold
keyBtn.TextSize = 16
keyBtn.TextColor3 = neonGreen
Instance.new("UICorner", keyBtn).CornerRadius = UDim.new(0, 6)
local btnStroke = Instance.new("UIStroke", keyBtn)
btnStroke.Color = neonGreen
btnStroke.Thickness = 2

local function loadMain()
    local mainGui = Instance.new("ScreenGui", game.CoreGui)
    mainGui.Name = "STREE_NativeHub"
    mainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local mainFrame = Instance.new("Frame", mainGui)
    mainFrame.Size = UDim2.new(0, 260, 0, 220)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = pureBlack
    mainFrame.BackgroundTransparency = 0.5
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)
    local mStroke = Instance.new("UIStroke", mainFrame)
    mStroke.Color = neonGreen
    mStroke.Thickness = 2

    local title = Instance.new("TextLabel", mainFrame)
    title.Size = UDim2.new(1, 0, 0, 25)
    title.BackgroundTransparency = 1
    title.Text = "STREE HUB"
    title.TextColor3 = neonGreen
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 18

    -- CLOSE BUTTON (X)
    local closeBtn = Instance.new("TextButton", mainFrame)
    closeBtn.Size = UDim2.new(0, 20, 0, 20)
    closeBtn.Position = UDim2.new(1, -25, 0, 5)
    closeBtn.BackgroundColor3 = pureBlack
    closeBtn.BackgroundTransparency = 0.5
    closeBtn.Text = "X"
    closeBtn.Font = Enum.Font.SourceSansBold
    closeBtn.TextSize = 14
    closeBtn.TextColor3 = neonGreen
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)
    local xStroke = Instance.new("UIStroke", closeBtn)
    xStroke.Color = neonGreen
    xStroke.Thickness = 2

    closeBtn.MouseButton1Click:Connect(function()
        mainGui.Enabled = false
    end)

    -- ESP / AIM TOGGLE
    local espOn = false
    local highlightList = {}

    local toggleBtn = Instance.new("TextButton", mainFrame)
    toggleBtn.Size = UDim2.new(0, 220, 0, 35)
    toggleBtn.Position = UDim2.new(0.5, -110, 0, 50)
    toggleBtn.BackgroundColor3 = pureBlack
    toggleBtn.BackgroundTransparency = 0.5
    toggleBtn.Text = "aFz ESP / Aim: OFF"
    toggleBtn.TextColor3 = neonGreen
    toggleBtn.Font = Enum.Font.SourceSansBold
    toggleBtn.TextSize = 15
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 6)
    local toggleStroke = Instance.new("UIStroke", toggleBtn)
    toggleStroke.Color = neonGreen

    toggleBtn.MouseButton1Click:Connect(function()
        espOn = not espOn
        toggleBtn.Text = espOn and "aFz ESP / Aim: ON" or "aFz ESP / Aim: OFF"

        for _, h in pairs(highlightList) do
            h:Destroy()
        end
        table.clear(highlightList)

        if espOn then
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                    if string.lower(p.Name):find("afz") then
                        local hl = Instance.new("Highlight", p.Character)
                        hl.Adornee = p.Character
                        hl.FillColor = neonGreen
                        hl.OutlineColor = Color3.new(1, 1, 1)
                        table.insert(highlightList, hl)
                    end
                end
            end
        end
    end)

    RunSvc.RenderStepped:Connect(function()
        if espOn then
            local closest, target, shortest = math.huge, nil, nil
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
                    if string.lower(plr.Name):find("afz") then
                        local pos, visible = camera:WorldToViewportPoint(plr.Character.Head.Position)
                        if visible then
                            local dist = (UIS:GetMouseLocation() - Vector2.new(pos.X, pos.Y)).Magnitude
                            if dist < closest then
                                closest = dist
                                target = plr
                            end
                        end
                    end
                end
            end
            if target and target.Character:FindFirstChild("Head") then
                camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character.Head.Position)
            end
        end
    end)

    -- RE-OPEN KEYBIND
    UIS.InputBegan:Connect(function(input, gpe)
        if not gpe and input.KeyCode == toggleKey then
            mainGui.Enabled = not mainGui.Enabled
        end
    end)
end

-- SUBMIT KEY
keyBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        keyGui:Destroy()
        loadMain()
    else
        keyBox.Text = "INVALID!"
        task.wait(1)
        keyBox.Text = "Key Salah❌"
    end
end)
