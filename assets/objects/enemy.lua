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
        table.insert(self.enemy_table, {x = self.enemy_table[#self.enemy_table].x + spacing, y = self.y)
    end
end

--Enemy:update(), Enemy:destroy() --> Compensate for spacing Enemy:draw()