uis.JumpRequest:Connect(function()
    if UNLOCKED and SETTINGS.InfiniteJump then
        local hum = plr.Character and plr.Character:FindFirstChildWhichIsA("Humanoid")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
