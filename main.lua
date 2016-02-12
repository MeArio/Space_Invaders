local Ship = require 'assets.objects.ship'
local Bullet = require 'assets.objects.bullet'

local ship
local bullets
local bullet_array = {}
function love.load()
    ship = Ship:new(100,650,100,20)
    bullets = Bullet:new(300, 20, 40,bullet_array)
end

function love.update(dt)
    ship:Move(dt)
    ship:CheckCollision()
    bullets:update(dt)
    bullets:destroy()
end

function love.draw()
    ship:Draw()
    bullets:draw()
end

local lastFireTime = 0

function love.keypressed(key)
    if key == "space" then
        if (love.timer.getTime() - lastFireTime) > 0.18 then
            bullets:create(ship.x + ship.w / 2,ship.y - ship.h * 2)
            lastFireTime = love.timer.getTime()
        end
    end
end
