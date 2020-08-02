local Camera    = require('middleclass')('Camera')

function Camera:initialize()
    self.x = 0
end

function Camera:update(dt)
    self.x = (self.x + 0.1) * (dt + 0.4)
end

return Camera