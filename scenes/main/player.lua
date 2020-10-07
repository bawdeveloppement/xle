local GameObject = require(_G.basedir .. "utils.baw.object.gameobject")
local Player = require(_G.basedir .. "utils.middleclass")('Player', GameObject);
local Vector2 = require(_G.basedir .. "utils.baw.utils.Vector2");
local RigidBody = require(_G.componentDir .. "rigidbody");

-- TODO : GameObject:initialize(self, { RigidBody })
-- for passing directly new components and catch if component
-- was already added
function Player:initialize(x, y, world)
    GameObject:initialize(self);
    self.transform:translate(Vector2:new(x, y))

    -- Todo lambda function for handling default parameter
    self:addComponent(RigidBody)
    self:getComponent(RigidBody):setActif(true);

    -- Get the component instance from the GameObject
    self.speed = 5;
    self.width = 55;
    self.height = 37;
    self.isground = false;
    

    self.sprite = love.graphics.newImage("/sprites/adventurer.png")
end

function Player:update(dt)
    self:updateComponents(dt);
end

function Player:getSpriteIndex(x)
    return love.graphics.newQuad(x, x, self.width, self.height, self.sprite:getDimensions())
end

function Player:draw()
    love.graphics.setColor(1,1,1,1);
    love.graphics.draw(self.sprite, self:getSpriteIndex(0), self.transform.position.x, self.transform.position.y, 0, 2);
end

return Player;