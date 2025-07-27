-- InfiniteJump.lua (Stealth Bypass for Steal A Brainrot)

_G.STREE_INFINITE_JUMP = _G.STREE_INFINITE_JUMP or false

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

-- Bypass: gunakan spawn() dan tidak langsung expose koneksi ke _G
local function EnableInfiniteJump()
    -- Disconnect koneksi lama
    if _G._INFINITE_JUMP_CONNECTION then
        pcall(function() _G._INFINITE_JUMP_CONNECTION:Disconnect() end)
        _G._INFINITE_JUMP_CONNECTION = nil
    end

    if _G.STREE_INFINITE_JUMP then
        _G._INFINITE_JUMP_CONNECTION = UIS.InputBegan:Connect(function(input, processed)
            if processed then return end
            if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
                local char = LocalPlayer.Character
                if char and char:FindFirstChildOfClass("Humanoid") then
                    -- Bypass via state cycling (tidak langsung pakai Jumping)
                    local humanoid = char:FindFirstChildOfClass("Humanoid")
                    if humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
                        humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
                        task.wait(0.05)
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end
        end)
    end
end

EnableInfiniteJump()

-- Auto cek toggle tiap detik
task.spawn(function()
    while true do
        task.wait(1)
        if _G.STREE_INFINITE_JUMP and not _G._INFINITE_JUMP_CONNECTION then
            EnableInfiniteJump()
        elseif not _G.STREE_INFINITE_JUMP and _G._INFINITE_JUMP_CONNECTION then
            _G._INFINITE_JUMP_CONNECTION:Disconnect()
            _G._INFINITE_JUMP_CONNECTION = nil
        end
    end
end)
