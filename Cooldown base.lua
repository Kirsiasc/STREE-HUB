--[[
📜 STREE HUB - Cooldown Base Viewer
🧠 Untuk game Steal A Brainrot
🎯 Menampilkan waktu cooldown semua base
]]

local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

-- Fungsi buat Billboard GUI
local function createBillboard(part, text)
    local billboard = Instance.new("BillboardGui")
    billboard.Name = "CooldownDisplay"
    billboard.Size = UDim2.new(0, 200, 0, 50)
    billboard.StudsOffset = Vector3.new(0, 4, 0)
    billboard.Adornee = part
    billboard.AlwaysOnTop = true
    billboard.Parent = part

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(0, 255, 0)
    label.TextStrokeColor3 = Color3.new(0, 0, 0)
    label.TextStrokeTransparency = 0.5
    label.TextScaled = true
    label.Font = Enum.Font.SourceSansBold
    label.Text = text
    label.Parent = billboard

    return label
end

-- Cek semua model di workspace
for _, base in pairs(Workspace:GetDescendants()) do
    if base:IsA("Model") then
        local part = base:FindFirstChild("HumanoidRootPart") or base:FindFirstChildWhichIsA("BasePart")
        local cooldown = base:FindFirstChild("Cooldown") or base:FindFirstChild("CooldownTime") or base:FindFirstChildWhichIsA("NumberValue")

        if part and cooldown and typeof(cooldown.Value) == "number" then
            local label = createBillboard(part, "Cooldown: " .. math.floor(cooldown.Value) .. "s")

            RunService.RenderStepped:Connect(function()
                if label and cooldown and cooldown.Parent then
                    label.Text = "Cooldown: " .. math.max(0, math.floor(cooldown.Value)) .. "s"
                end
            end)
        end
    end
end
