local Cooldown = {}
Cooldown.__index = Cooldown

function Cooldown.new(duration)
    return setmetatable({
        active = false,
        duration = duration,
        remaining = 0,
        lastUpdate = love.timer.getTime()
    }, Cooldown)
end

function Cooldown:start()
    self.active = true
    self.remaining = self.duration
    self.lastUpdate = love.timer.getTime()
end

function Cooldown:update()
    if not self.active then return end

    local currentTime = love.timer.getTime()
    local delta = currentTime - self.lastUpdate
    self.lastUpdate = currentTime

    self.remaining = self.remaining - delta

    if self.remaining <= 0 then
        self.remaining = 0
        self.active = false
    end
end

function Cooldown:isReady()
    return not self.active
end

function Cooldown:getRemaining()
    return math.max(0, self.remaining)
end

function Cooldown:getProgress()
    if self.duration == 0 then return 1 end
    return 1 - (self.remaining / self.duration)
end

-- Example usage
local abilityCooldown = Cooldown.new(5)

function love.update(dt)
    abilityCooldown:update()

    if love.keyboard.isDown('space') and abilityCooldown:isReady() then
        print("Ability used!")
        abilityCooldown:start()
    end
end

function love.draw()
    if not abilityCooldown:isReady() then
        love.graphics.setColor(0, 1, 0) -- hijau neon
        love.graphics.setFont(love.graphics.newFont(24))
        love.graphics.print(string.format("%.1f", abilityCooldown:getRemaining()), 10, 30)
        love.graphics.setColor(1, 1, 1) -- reset
    else
        love.graphics.print("Ready! Press SPACE", 10, 30)
    end
end
