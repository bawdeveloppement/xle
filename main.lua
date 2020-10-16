-- GLOBAL --
_G.baseDir      = (...):match("(.-)[^%.]+$")
_G.engineDir      = _G.baseDir .. "engine."
_G.assetDir      = _G.baseDir .. "assets."
_G.componentDir   = _G.engineDir .. "baw.components.";

local BawEditor = require(_G.engineDir .. "baw.BawEditor");
local Engine = require(_G.engineDir .. "resty-ecs.engine");

function love.conf(t)
end

function love.load(arg)
    Engine = Engine:new()
    
    -- BawEditor = BawEditor:new();
    -- local content = love.filesystem.getDirectoryItems("engine/resty-ecs/")
    -- print(#content)
    -- for k, v in pairs(content) do
    --     print(v)
    -- end
end

function love.update(dt)
    -- BawEditor:update(dt);

end

function love.draw()
    -- BawEditor:draw();
end