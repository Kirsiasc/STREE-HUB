-- STREE HUB Infinite Jump Bypass [Steal A Brainrot]
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

_G.STREE_INFINITE_JUMP = _G.STREE_INFINITE_JUMP or false

-- Anti-cheat bypass function
local function PatchAntiJump()
    -- Block any remote related to jump/fly exploit
    for _, name in ipairs({"JumpDetected", "ViolationReport", "ServerLog", "ReportExploit"}) do
        local remote = ReplicatedStorage:FindFirstChild(name)
        if remote and remote:IsA("RemoteEvent") then
            remote:Destroy()
        end
    end

    -- Hook any function with suspicious jump check
    for _, func in pairs(getgc(true)) do
        if typeof(func) == "function" and islclosure(func) then
            local info = debug.getinfo(func)
            if info and info.name and (info.name:lower():find("jump") or info.name:lower():find("air")) then
                hookfunction(func, function() return end)
            end
        end
    end
end

-- Infinite Jump
local function EnableInfiniteJump()
    UIS.JumpRequest:Connect(function()
        if _G.STREE_INFINITE_JUMP then
            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end)
end

-- Run when toggle is ON
if _G.STREE_INFINITE_JUMP then
    PatchAntiJump()
    EnableInfiniteJump()
						end
