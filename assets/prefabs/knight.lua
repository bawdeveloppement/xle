local Knight = require(_G.engineDir .. "middleclass")("Knight")

Knight.static.instances = {}

function Knight:initialize(name, x, y)
    self.name = name;
    self.x = x;
    self.y = y;

    table.insert(Knight.instances, self);
end

function Knight:update(dt)
    
end

function Knight:draw()
    love.graphics.rectangle("fill", self.x, self.y, 10, 10);
end

return {
    default = Knight:new("Devwarlt", 0, 2),
    class = Knight
}