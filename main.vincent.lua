-- Config --
love.graphics.setDefaultFilter("nearest")
-- End Config --

-- Require --
local Camera    = require('camera')
local City      = require('city')
-- End Require --

-- Global Value --
local dimx, dimy = 0, 0;
-- End global

local player = love.graphics.newImage("adventurer.png")

--[[
    Si tu veux apprendre plus sur le systéme de class que j'utilise
    https://en.wikisource.org/wiki/Module:Middleclass
]]--

function love.load()
    love.graphics.setBackgroundColor(20/255,24/255,82/255);
    love.window.setMode(800, 600);
    dimx, dimy = love.window.getMode();
    City = City:new(dimx, dimy);
end

function love.update(dt)
    Camera:update(dt)
    City:update(dt)
end

function love.draw()
    City:draw()
end