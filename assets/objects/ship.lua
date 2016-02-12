local class = require 'libs.middleclass'

local Ship = class('Ship')

function Ship:initialize(x, y ,w, h)
    self.x = x
    self.y = y
    self.w = w
    self.h = h
end

function Ship:Move(dt)
    if love.keyboard.isDown("d") then
        self.x = self.x + 200 * dt
    elseif love.keyboard.isDown("a") then
        self.x = self.x - 200 * dt
    end
end

function Ship:CheckCollision()
    if self.x <= 0 then
        self.x = 0
    end
    if self.x >= love.graphics.getWidth() - self.w then
        self.x = love.graphics.getWidth() - self.w
    end
end

function Ship:Draw()
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

return Ship