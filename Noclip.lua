for _, v in pairs(plr.Character:GetDescendants()) do
    if v:IsA("BasePart") then
        v.CanCollide = false
    end
end
