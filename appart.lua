local Appart = require('middleclass')('Appart');

function Appart:initialize(x, y, w, h)
    self.x = x;
    self.y = y;
    self.w = w;
    self.h = h;
    self.rooms = w * h;
end

function Appart:draw()
    -- On doit prendre la position de la camera
    -- Et afficher les batiment relatif à celle ci
    self:drawoutline();
end

function Appart:drawoutline()
    love.graphics.setColor(0.9, 0.9, 0.9, 1);
    local i = 0
    local j = 0
    while i < self.h do
        j = 0
        while j < self.w do
            love.graphics.line(self.x + j * 10, self.y - i * 10, self.x + j * 10, self.y -  (i * 10 + 10))
            love.graphics.line(self.x + j * 10, self.y - i * 10, self.x + j * 10 + 10, self.y - i * 10)
            if i ~= self.h - 1 then
                love.graphics.line(self.x + j * 10 + 10, self.y - (i * 10 + 10), self.x + j * 10 + 10, self.y - i * 10)
            end
            if j ~= self.w - 1 then
                love.graphics.line(self.x + j * 10 + 10, self.y - (i * 10 + 10), self.x + j * 10, self.y - (i * 10 + 10))
            end
            if j == self.w - 1 and i == self.h - 1 then
                love.graphics.line(self.x + j * 10 + 10, self.y - (i * 10 + 10), self.x + j * 10, self.y - (i * 10 + 10))
                love.graphics.line(self.x + j * 10 + 10, self.y - (i * 10 + 10), self.x + j * 10 + 10, self.y - i * 10)
            end
            j = j + 1
        end
        i = i + 1
    end
end

return Appart;