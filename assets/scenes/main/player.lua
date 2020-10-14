local GameObject = require(_G.engineDir .. "baw.object.gameobject")
local Player = require(_G.engineDir .. "middleclass")('Player', GameObject);
local Vector2 = require(_G.engineDir .. "baw.utils.Vector2");
local Transform = require(_G.componentDir .. "transform");

-- TODO : GameObject:initialize(self, { RigidBody })
-- for passing directly new components and catch if component
-- was already added
-- TODO : Verify if object passed in initialisation of GameObject is already assigned
--        And if yes, try to assign values if values exist

function Player:initialize(x, y, world)
    GameObject:initialize(self);
    self.transform:translate(Vector2:new(x, y))

    -- Get the component instance from the GameObject
    self.stats = {
        speed = 5
    };

    self.maxstats = {
        speed = 75
    };

    self.width = 55;
    self.height = 37;
    self.sprite = love.graphics.newImage("/assets/sprites/adventurer.png")
end

function Player:update(dt)
    self:updateComponents(dt);
    if      love.keyboard.isDown("q") then
        self.transform.position:add(-(4 + 5.6 * (self.stats.speed / self.maxstats.speed)), 0);
    end
    if  love.keyboard.isDown("d") then
        self.transform.position:add(4 + 5.6 * (self.stats.speed / self.maxstats.speed), 0);
    end
    if  love.keyboard.isDown("s") then
        self.transform.position:add(0, 4 + 5.6 * (self.stats.speed / self.maxstats.speed));
    end
    if  love.keyboard.isDown("z") then
        self.transform.position:add(0, -(4 + 5.6 * (self.stats.speed / self.maxstats.speed)));
    end
end

function Player:getSpriteIndex(x)
    return love.graphics.newQuad(x, x, self.width, self.height, self.sprite:getDimensions())
end

function Player:draw()
    love.graphics.setColor(1,1,1,1);
    love.graphics.draw(self.sprite, self:getSpriteIndex(0), self.transform.position.x, self.transform.position.y, 0, 2);
end

return Player;