-- Config --
love.graphics.setDefaultFilter("nearest")
-- End Config --

-- Require --
local Camera    = require('camera')
local City      = require('city')
-- End Require --

-- Global Value --
local dimx, dimy = 0, 0;
local MainCity;
local BgCity;
-- End global

local player = love.graphics.newImage("adventurer.png")

--[[
    Si tu veux apprendre plus sur le systéme de class que j'utilise
    https://en.wikisource.org/wiki/Module:Middleclass
]]--

function love.load()
    love.graphics.setBackgroundColor(137/255,175/255,192/255);
    love.window.setMode(800, 600);
    dimx, dimy = love.window.getMode();
    MainCity = City:new(dimx, dimy, {1,1,1,1});
    BgCity = City:new(dimx, dimy, {0.8,0.8,0.8,1}, 40);
    BgCity.debug = true -- For text debugging => City content
end

function love.update(dt)
    Camera:update(dt)
    MainCity:update(dt)
    BgCity:update(dt)
end

function love.draw()
    BgCity:draw()
    MainCity:draw()
end
