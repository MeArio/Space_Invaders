local class = require 'libs.middleclass'

local Bullet = class('Bullet')

function Bullet:initialize(speed, width, height,bullets)
    self.width = width
    self.height = height
    self.speed = speed
    self.bullets = bullets
end

function Bullet:create(x,y)
    self.x = x
    self.y = y
    table.insert(self.bullets, {x = self.x, y = self.y})
end

function Bullet:update(dt)
    for i, v in ipairs(self.bullets) do
        v.y = v.y - self.speed * dt
    end 
end

function Bullet:draw()
    love.graphics.setColor(255, 255, 255)
    for i, v in ipairs(self.bullets) do
        love.graphics.rectangle("fill", v.x, v.y, self.width, self.height)
    end
end

function Bullet:destroy()
    for i, v in ipairs(self.bullets) do
        if v.y >= love.graphics.getHeight() then
            table.remove(self.bullets, i)
        end
    end
end

return Bullet