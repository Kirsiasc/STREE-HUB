--[[  
📜 STREE HUB - Cooldown Base Viewer (Toggle OrionLib)  
🧠 Untuk game Steal A Brainrot  
🎯 Menampilkan waktu cooldown semua base dengan ON/OFF Toggle  
🔧 Dibuat oleh kirsiasc  
]]

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
    Name = "STREE HUB | Steal A Brainrot",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "STREE HUB"
})

local VisualTab = Window:MakeTab({
    Name = "Visual",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local CooldownEnabled = false
local BillboardList = {}

-- Fungsi buat Billboard GUI
local function createBillboard(part, cooldown)
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
    label.Text = "Cooldown: " .. math.floor(cooldown.Value) .. "s"
    label.Parent = billboard

    return {
        Billboard = billboard,
        Label = label,
        Cooldown = cooldown
    }
end

-- Update label teks tiap frame
RunService.RenderStepped:Connect(function()
    if CooldownEnabled then
        for _, data in ipairs(BillboardList) do
            if data.Label and data.Cooldown and data.Cooldown.Parent then
                data.Label.Text = "Cooldown: " .. math.max(0, math.floor(data.Cooldown.Value)) .. "s"
            end
        end
    end
end)

-- Aktifkan ESP cooldown base
local function enableCooldownViewer()
    for _, base in pairs(Workspace:GetDescendants()) do
        if base:IsA("Model") then
            local part = base:FindFirstChild("HumanoidRootPart") or base:FindFirstChildWhichIsA("BasePart")
            local cooldown = base:FindFirstChild("Cooldown") or base:FindFirstChild("CooldownTime") or base:FindFirstChildWhichIsA("NumberValue")

            if part and cooldown and typeof(cooldown.Value) == "number" then
                table.insert(BillboardList, createBillboard(part, cooldown))
            end
        end
    end
end

-- Nonaktifkan (hapus semua Billboard)
local function disableCooldownViewer()
    for _, data in ipairs(BillboardList) do
        if data.Billboard then
            data.Billboard:Destroy()
        end
    end
    BillboardList = {}
end

-- Toggle OrionLib
VisualTab:AddToggle({
    Name = "Base Cooldown Viewer",
    Default = false,
    Callback = function(Value)
        CooldownEnabled = Value
        if Value then
            enableCooldownViewer()
        else
            disableCooldownViewer()
        end
    end
})
