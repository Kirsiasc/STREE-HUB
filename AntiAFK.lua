local AntiAFK_Enabled = false
local Connection

function ToggleAntiAFK(state)
    AntiAFK_Enabled = state
    if state then
        Connection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
            local vu = game:GetService("VirtualUser")
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    else
        if Connection then
            Connection:Disconnect()
        end
    end
end
