local Config    = require(_G.engineDir .. "middleclass")("Config");
local JSON      = require(_G.engineDir .. "json");

function Config:initialize()
    self:init();
    self:bind();
end

function Config:init()
    -- TODO: Save config file in appDataUserDirectory
    local content, size = love.filesystem.read("config.json");
    local decoded = JSON.decode(content);
    love.graphics.setDefaultFilter("nearest")
    self.fullscreen = decoded.window.fullscreen;
    self.resolution = decoded.window.resolution;
end

function Config:bind()
    love.window.setMode(self.resolution.width, self.resolution.height, {
        resizable = true,
        fullscreen = self.fullscreen
    });
end

return Config