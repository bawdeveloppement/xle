local Player = require("middleclass")('Player');

function Player:initialize(x, y)
    self.x = x;
    self.y = y;
end

function Player:update()
end

function Player:draw()
    love.graphics.setColor(1, 0, 0, 1);
    love.graphics.rectangle("fill", self.x, self.y, 32, 32);
end

return Player;