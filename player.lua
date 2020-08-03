local Player = require("middleclass")('Player');

function Player:initialize(x, y, world)
    self.x = x;
    self.y = y;
    self.width = 55;
    self.height = 37;
    self.world = world;
    self.body = love.physics.newBody(world, self.x, self.y, "dynamic")
    self.shape = love.physics.newRectangleShape(self.width * 2, self.height * 2);
    self.fixture = love.physics.newFixture(self.body, self.shape, 1);
    self.sprite = love.graphics.newImage("adventurer.png")
end

function Player:update()
    if love.keyboard.isDown("right") then
        self.body:applyForce(500, 0);
    end
    if love.keyboard.isDown("space") then
        self.body:setPosition(self.x, 200);
        self.body:setLinearVelocity(0, 0);
    end

    self.x = self.body:getX()
    self.y = self.body:getY()
end

function Player:getSpriteIndex(x)
    return love.graphics.newQuad(x, x, self.width, self.height, self.sprite:getDimensions())
end

function Player:draw()
    love.graphics.setColor(1,1,1,1);
    love.graphics.draw(self.sprite, self:getSpriteIndex(0), self.x, self.y, 0, 2);
end

return Player;