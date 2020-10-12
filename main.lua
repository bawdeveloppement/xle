-- GLOBAL --
-- _G.readdir = love.filesystem.getRealDirectory("main.lua")

_G.baseDir      = (...):match("(.-)[^%.]+$")
_G.engineDir      = _G.baseDir .. "engine."
_G.assetDir      = _G.baseDir .. "assets."
_G.componentDir   = _G.engineDir .. "baw.components.";
-- End GLOBAL --

-- Require --
-- local Camera        = require('utils.baw.object.primitives.camera').Default
-- local City          = require('scenes.main.city')
-- local Player        = require('scenes.main.player')
local Json      = require("engine.json")
local MainScene     = require(_G.assetDir..'scenes.main.mainscene'):new("Hello")
local SceneManager  = require(_G.engineDir..'baw.object.manager'):new(MainScene);
local GameObject    = require('engine.baw.object.gameobject');
-- End Require --

-- Global Value --
local dimx, dimy = 0, 0;
local MainCity;
local BgCity;

Config = {}
Config.debug = true
-- End global

--[[
    Si tu veux apprendre plus sur le systéme de class que j'utilise
    https://en.wikisource.org/wiki/Module:Middleclass
]]--

local Vector2   = require(_G.engineDir..'baw.utils.Vector2');
local Components= require(_G.componentDir..'all');
local Player    = require(_G.assetDir..'scenes.main.player'):new()
local Config    = require(_G.engineDir..'baw.utils.config');

function love.load(arg)
    for i, v in pairs(arg) do
        print(v)
        print(i)
    end
    -- Load config file
    -- TODO: Set a config file for user
    Config = Config:new()
    -- END load

    -- Settings Window
    love.graphics.setBackgroundColor(137/255,175/255,192/255);
    dimx, dimy = love.window.getMode();
    -- End settings
    -- Settings the game
    -- MainCity = City:new(dimx, dimy, {1,1,1,1});
    -- BgCity = City:new(dimx, dimy, {0.8,0.8,0.8,1}, 40);
    -- Jessica = Player:new(0, 0, MainCity.world);
    -- End settings

    -- Using the getComponent function;
    -- local search = Player:getComponent(Components.Text)
    -- if search then
    --     print("yeah") else print("nop")
    -- end
end

function love.update(dt)
    Player:update(dt)
    -- Camera:update(dt)
    -- MainCity:update(dt)
    -- BgCity:update(dt)
    -- Jessica:update(dt)
    -- SceneManager:update(dt)

end

function love.draw()
    Player:draw();
    -- BgCity:draw()
    -- MainCity:draw()
    -- Jessica:draw()
    -- SceneManager:draw()
end