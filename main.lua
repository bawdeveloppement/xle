-- Config --
love.graphics.setDefaultFilter("nearest")
-- End Config --

-- Require --
local Camera    = require('camera'):new()
local City      = require('city')
-- End Require --

-- Global Value --
local dimx, dimy = 0, 0;
-- End global

local player = love.graphics.newImage("adventurer.png")

function love.load()
    love.graphics.setBackgroundColor(20/255,24/255,82/255);
    love.window.setMode(400, 400);
    dimx, dimy = love.window.getMode();
    City = City:new(dimx, dimy);
end

function love.update(dt)
    City:update()
end

function love.draw()
    City:draw()
end