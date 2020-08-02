local Appart    = require 'appart'
local City      = require('middleclass')('City')

--[[
    Ici on génere la ville entiére
]]--

function City:initialize(w, y)
    self.apparts = {}
    -- Ground
    self.ground = {}
    self.ground.y = y
    self.ground.w = w
    self.ground.h = 40
    -- End Ground
    local tempw = 0;
    local i = 1;
    while tempw < w do
        table.insert(self.apparts, Appart:new(tempw, self.ground.y - self.ground.h, love.math.random(3, 5)))
        tempw = tempw + (self.apparts[i].w * 20) + 20
        i = i + 1
    end
end

function City:update(dt)
end

function City:draw()
    love.graphics.setColor(61/255,67/255,99/255,1);
    love.graphics.rectangle("fill", 0, self.ground.y - self.ground.h, self.ground.w, self.ground.h)
    for i,v in ipairs(self.apparts) do
        v:draw()
    end
end

return City;