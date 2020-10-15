-- GLOBAL --
_G.baseDir      = (...):match("(.-)[^%.]+$")
_G.engineDir      = _G.baseDir .. "engine."
_G.assetDir      = _G.baseDir .. "assets."
_G.componentDir   = _G.engineDir .. "baw.components.";

local BawEditor = require(_G.engineDir .. "baw.BawEditor");

function love.load(arg)
    BawEditor = BawEditor:new();
end

function love.update(dt)
    BawEditor:update(dt);
end

function love.draw()
    BawEditor:draw();
end