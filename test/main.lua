-- Config --
-- _G.readdir = love.filesystem.getRealDirectory("main.lua")
local Json      = require("utils.json")
_G.basedir = (...):match("(.-)[^%.]+$")
love.graphics.setDefaultFilter("nearest")
-- End Config --

-- Require --
-- local Camera        = require('utils.baw.object.primitives.camera').Default
-- local City          = require('scenes.main.city')
-- local Player        = require('scenes.main.player')
local MainScene     = require('scenes.main.mainscene'):new("Hello")
local SceneManager  = require('scenes.manager'):new(MainScene);
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

function love.load()
    -- Settings Window
    love.graphics.setBackgroundColor(137/255,175/255,192/255);
    love.window.setMode(800, 600);
    dimx, dimy = love.window.getMode();
    -- End settings
    
    -- Settings the game
    -- MainCity = City:new(dimx, dimy, {1,1,1,1});
    -- BgCity = City:new(dimx, dimy, {0.8,0.8,0.8,1}, 40);
    -- Jessica = Player:new(0, 0, MainCity.world);
    -- End settings
end

function love.update(dt)
    -- Camera:update(dt)
    -- MainCity:update(dt)
    -- BgCity:update(dt)
    -- Jessica:update(dt)
    SceneManager:update(dt)
end

function love.draw()
    -- BgCity:draw()
    -- MainCity:draw()
    -- Jessica:draw()
    SceneManager:draw()
end