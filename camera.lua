local Camera    = require('middleclass')('Camera')


function Camera:initialize() end

Camera.static.x = 0
Camera.static.debugMode = true

function Camera:update(dt)
    Camera.x = (Camera.x + 0.1) * (dt + 0.4)
end

function Camera:draw()
    local WinW, WinH= love.window.getMode();
end

return Camera