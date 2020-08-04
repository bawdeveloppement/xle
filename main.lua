_G.basedir = (...):match("(.-)[^%.]+$")
_G.readdir = love.filesystem.getRealDirectory("main.lua")
-- Config --
love.graphics.setDefaultFilter("nearest")
-- End Config --

-- Require --
local Camera    = require('utils.baw.object.primitives.camera').Default
local City      = require('scenes.main.city')
local Player    = require('scenes.main.player')
-- End Require --

-- Global Value --
local dimx, dimy = 0, 0;
local MainCity;
local BgCity;
-- End global

--[[
    Si tu veux apprendre plus sur le systéme de class que j'utilise
    https://en.wikisource.org/wiki/Module:Middleclass
]]--
local http      = require("socket.http");

function love.load()
    -- Settings Window
    love.graphics.setBackgroundColor(137/255,175/255,192/255);
    love.window.setMode(800, 600);
    dimx, dimy = love.window.getMode();
    -- End settings
    
    -- Settings the game
    MainCity = City:new(dimx, dimy, {1,1,1,1});
    BgCity = City:new(dimx, dimy, {0.8,0.8,0.8,1}, 40);
    Jessica = Player:new(0, 0, MainCity.world);
    -- End settings
end

function love.update(dt)
    Camera:update(dt)
    MainCity:update(dt)
    BgCity:update(dt)
    Jessica:update(dt)
end

function love.draw()
    BgCity:draw()
    MainCity:draw()
    Jessica:draw()
end

-- function love.keypressed( key, scancode, isrepeat)
--     http.request{
--         url = "http://localhost:3001/jess/"..Jessica.x, 
--         method = "GET"
--     };
-- end