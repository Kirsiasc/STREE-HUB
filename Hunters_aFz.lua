-- NativeHub v3 | STREE HUB
-- Key : PRRI TETAP JAYA
-- Features : Native UI + KeySystem + ESP + Highlight + AimBot + Silinder Toggle

if not game:IsLoaded() then game.Loaded:Wait() end
local Players = game:GetService("Players")
local UIS     = game:GetService("UserInputService")
local RunSvc  = game:GetService("RunService")
local TweenSvc= game:GetService("TweenService")
local player  = Players.LocalPlayer
local camera  = workspace.CurrentCamera

-- ========== 1. KEY SYSTEM ==========
local correctKey = "PRRI TETAP JAYA"
local keyGui = Instance.new("ScreenGui")
keyGui.Name = "KeyGui"
keyGui.Parent = game:GetService("CoreGui")
keyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 320, 0, 180)
keyFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
keyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
keyFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
keyFrame.BorderSizePixel = 0
keyFrame.Parent = keyGui
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 8)

local keyLabel = Instance.new("TextLabel")
keyLabel.Size = UDim2.new(1, -20, 0, 40)
keyLabel.Position = UDim2.new(0, 10, 0, 10)
keyLabel.BackgroundTransparency = 1
keyLabel.Text = "Enter Key:"
keyLabel.TextColor3 = Color3.new(1, 1, 1)
keyLabel.Font = Enum.Font.SourceSansBold
keyLabel.TextSize = 18
keyLabel.Parent = keyFrame

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(1, -20, 0, 40)
keyBox.Position = UDim2.new(0, 10, 0, 55)
keyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
keyBox.TextColor3 = Color3.new(1, 1, 1)
keyBox.Font = Enum.Font.SourceSans
keyBox.TextSize = 16
keyBox.PlaceholderText = "Key..."
keyBox.ClearTextOnFocus = false
keyBox.Parent = keyFrame

local keyBtn = Instance.new("TextButton")
keyBtn.Size = UDim2.new(0, 100, 0, 35)
keyBtn.Position = UDim2.new(0.5, -50, 0, 110)
keyBtn.BackgroundColor3 = Color3.fromRGB(60, 150, 255)
keyBtn.Text = "Submit"
keyBtn.Font = Enum.Font.SourceSansBold
keyBtn.TextSize = 16
keyBtn.TextColor3 = Color3.new(1, 1, 1)
keyBtn.Parent = keyFrame
Instance.new("UICorner", keyBtn).CornerRadius = UDim.new(0, 6)

keyBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == correctKey then
        keyGui:Destroy()
        loadMain()
    else
        keyBox.Text = "INVALID!"
        task.wait(1)
        keyBox.Text = ""
    end
end)

-- ========== 2. MAIN UI ==========
function loadMain()
    local mainGui = Instance.new("ScreenGui")
    mainGui.Name = "STREE_NativeHub"
    mainGui.Parent = game:GetService("CoreGui")
    mainGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 260, 0, 220)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    mainFrame.Draggable = true
    mainFrame.Parent = mainGui
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 8)

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 25)
    title.BackgroundTransparency = 1
    title.Text = "STREE HUB"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.SourceSansBold
    title.TextSize = 18
    title.Parent = mainFrame

    -- ========== ESP + AimBot ==========
    local espActive = false
    local highlightTable = {}

    function toggleESP()
        for _, hl in pairs(highlightTable) do
            hl:Destroy()
        end
        table.clear(highlightTable)

        if not espActive then
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local nameLower = string.lower(plr.Name)
                    if nameLower:find("afz") then
                        local hl = Instance.new("Highlight")
                        hl.Adornee = plr.Character
                        hl.FillColor = Color3.fromRGB(255, 0, 0)
                        hl.OutlineColor = Color3.new(1, 1, 1)
                        hl.Parent = plr.Character
                        table.insert(highlightTable, hl)
                    end
                end
            end
        end
    end

    -- Auto Aimbot on RenderStepped
    RunSvc.RenderStepped:Connect(function()
        if espActive then
            local closestDist, target = math.huge, nil
            for _, plr in pairs(Players:GetPlayers()) do
                if plr ~= player and plr.Character and plr.Character:FindFirstChild("Head") then
                    if string.lower(plr.Name):find("afz") then
                        local headPos, onScreen = camera:WorldToViewportPoint(plr.Character.Head.Position)
                        if onScreen then
                            local dist = (Vector2.new(headPos.X, headPos.Y) - UIS:GetMouseLocation()).Magnitude
                            if dist < closestDist then
                                closestDist = dist
                                target = plr
                            end
                        end
                    end
                end
            end
            if target and target.Character and target.Character:FindFirstChild("Head") then
                camera.CFrame = CFrame.new(camera.CFrame.Position, target.Character.Head.Position)
            end
        end
    end)

    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 220, 0, 35)
    toggleBtn.Position = UDim2.new(0.5, -110, 0, 45)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggleBtn.Text = "aFz ESP / Aim: OFF"
    toggleBtn.TextColor3 = Color3.new(1, 1, 1)
    toggleBtn.Font = Enum.Font.SourceSansBold
    toggleBtn.TextSize = 16
    toggleBtn.Parent = mainFrame
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 6)

    toggleBtn.MouseButton1Click:Connect(function()
        espActive = not espActive
        toggleBtn.Text = espActive and "aFz ESP / Aim: ON" or "aFz ESP / Aim: OFF"
        toggleESP()
    end)
end
