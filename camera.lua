local Camera    = require('middleclass')('Camera')
local WinW, WinH= love.window.getMode();

Camera.static.x = 0
Camera.static.debugMode = false

function Camera:initialize() end

function Camera:update(dt)
    Camera.x = (Camera.x + 0.1) * (dt + 0.4)
end

function Camera:draw()
    if Camera.debug then
        love.graphics.setColor(0,1,0,1);
        love.graphics.circle(
            "fill",
            WinW / 2,
            WinH / 2,
            2,
            2
        );
    end
end

return Camera