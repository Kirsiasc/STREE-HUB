local cooldown = false
local cooldownTime = 3 -- waktu cooldown dalam detik

function doAction()
    if cooldown then
        warn("Masih cooldown, tunggu dulu bro!")
        return
    end

    -- Aksi utama di sini
    print("Aksi dilakukan!")

    -- Mulai cooldown
    cooldown = true
    task.delay(cooldownTime, function()
        cooldown = false
        print("Cooldown selesai, bisa dipakai lagi!")
    end)
end

-- Contoh: Hubungkan ke tombol keyboard
game:GetService("UserInputService").InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.E then
        doAction()
    end
end)
