local class = require 'libs.middleclass'

local Enemy = class('Enemy')

function Enemy:initialize(speed, width, height, x, y, spacing, enemy_table)
    self.speed = speed
    self.width = width
    self.height = height
    self.x = x
    self.y = y
    self.spacing = spacing
    self.enemy_table = enemy_table
end

function Enemy:create()
    if #self.enemy_table == 0 then
        table.insert(self.enemy_table, {x = self.x, y = self.y})
    else
        table.insert(self.enemy_table, {x = self.enemy_table[#self.enemy_table].x + self.spacing, alive = true)
    end
end

function Enemy:checkCollision()
    for i, enemy in ipairs(self.enemy_table) do
        if enemy.x >= love.graphics.getWidth() then
            self.y = self.y + spacing
            enemy.x = self.x
        end
    end
end

function Enemy:update()
    for i, enemy in ipairs(self.enemy_table) do
        if i ~= 1 then
            enemy.x = enemy[x-1] + self.spacing
            enemy.y = self.y
        end
    end
end

function Enemy:draw()
    for i, enemy in ipairs(self.enemy_table) do
        if enemy.alive then
            love.graphics.setColor(0, 255, 0)
            love.graphics.rectangle("fill", enemy.x, enemy.y, self.width, self.height)
        end
    end
end
--Enemy:update(), Enemy:destroy() --> Compensate for spacing Enemy:draw()