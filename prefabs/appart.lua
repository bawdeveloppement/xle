local Appart = require(_G.basedir .. 'utils.middleclass')('Appart');

function Appart:initialize(x, y, color, scale)
    self.x = x;
    self.y = y;
    self.w = love.math.random(3, 6);
    self.h = love.math.random(4, 15);
    self.scale = scale or 20
    self.globalw = self.w * self.scale;
    self.globalh = self.h * self.scale;
    self.space = love.math.random(1, 10) * 10;
    self.rooms = self.w * self.h;
    self.color = color or { 50/255, 50/255, 48/255, 1 }
end

function Appart:update(dt, camx)
    self.x = self.x - camx
end

function Appart:draw()
    self:drawoutline();
end

function Appart:drawoutline()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill", self.x, self.y - self.h * self.scale, self.w * self.scale, self.h * self.scale)
    love.graphics.setColor(55/255, 55/255, 51/255, 1)
    local i = 0
    local j = 0
    while i < self.h  do
        j = 0
        while j < self.w do
            love.graphics.line(self.x + j * self.scale, self.y - i * self.scale, self.x + j * self.scale, self.y -  (i * self.scale + self.scale))
            love.graphics.line(self.x + j * self.scale, self.y - i * self.scale, self.x + j * self.scale + self.scale, self.y - i * self.scale)
            if i ~= self.h - 1 then
                love.graphics.line(self.x + j * self.scale + self.scale, self.y - (i * self.scale + self.scale), self.x + j * self.scale + self.scale, self.y - i * self.scale)
            end
            if j ~= self.w - 1 then
                love.graphics.line(self.x + j * self.scale + self.scale, self.y - (i * self.scale + self.scale), self.x + j * self.scale, self.y - (i * self.scale + self.scale))
            end
            if j == self.w - 1 and i == self.h - 1 then
                love.graphics.line(self.x + j * self.scale + self.scale, self.y - (i * self.scale + self.scale), self.x + j * self.scale, self.y - (i * self.scale + self.scale))
                love.graphics.line(self.x + j * self.scale + self.scale, self.y - (i * self.scale + self.scale), self.x + j * self.scale + self.scale, self.y - i * self.scale)
            end
            j = j + 1
        end
        i = i + 1
    end
end

return Appart;