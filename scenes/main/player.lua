local Player = require(_G.basedir .. "utils.middleclass")('Player');

function Player:initialize(x, y, world)
    self.x = x;
    self.y = y;
    self.speed = 5;
    self.width = 55;
    self.height = 37;
    self.isground = false;
    self.sprite = love.graphics.newImage("/sprites/adventurer.png")
end

function Player:update(dt)
    if not self.isground then
        self.y = self.y + dt
    end
    if love.keyboard.isDown("right") then
        self.x = self.x + (self.speed + dt)
    elseif love.keyboard.isDown("left") then
        self.x = self.x - (self.speed + dt)
    end
end

function Player:getSpriteIndex(x)
    return love.graphics.newQuad(x, x, self.width, self.height, self.sprite:getDimensions())
end

function Player:draw()
    love.graphics.setColor(1,1,1,1);
    love.graphics.draw(self.sprite, self:getSpriteIndex(0), self.x, self.y, 0, 2);
end

return Player;