local Screen = require(_G.engineDir .. "middleclass")("Screen");

Screen.static.screens = {}

function Screen:initialize(name, active)
    self.name, self.active = name or "unknow", active or false;
    if #Screen.screens == 0 then self.active = true else self.active = false end
    table.insert(Screen.screens, self);
end

function Screen:update(dt)
end

function Screen:draw()
    love.graphics.print(self.name, 20, 20, 0, 2, 2);
end

return Screen