local Appart    = require 'appart'
local City      = require('middleclass')('City')

--[[
    Ici on génere la ville entiére
]]--

function City:initialize(y)
    self.apparts = {}
    table.insert(self.apparts, Appart:new(0, y, 5, 8))
end

function City:update(dt)
end

function City:draw()
    self.apparts[1]:draw()
end

return City;