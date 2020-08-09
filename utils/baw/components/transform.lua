local Transform = require(_G.basedir .. "utils.middleclass")("Transform");

function Transform:initialize(...)
    self.axe = {
        x = arg.ax or 0,
        y = arg.ay or 0
    };
    self.rotation = {
        x = arg.rx or 0,
        y = arg.ry or 0
    };
    self.scale = {
        x = arg.sx or 0,
        y = arg.sy or 0
    };
    -- self.child = {}
    self.gameobject = arg.gameobject;
end

function Transform:getVector()
    return self.axe;
end

function Transform:getRotation()
    return self.rotation;
end

function Transform:update(dt)
    self.axe.x = self.axe.x + 1 * dt
end

function Transform:draw()
    if Config.debug ~= nil and Config.debug then
        love.graphics.print(self.axe.x)
    end
end

function Transform:getScale()
    return self.scale;
end

function Transform:translate(x, y)
    self.axe = {
        x = x or 0,
        y = y or 0
    }
end

return Transform