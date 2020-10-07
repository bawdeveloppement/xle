local Component = require(_G.componentDir .. "component");
local RigidBody = require(_G.basedir .. "utils.middleclass")("RigidBody", Component);

function RigidBody:initialize(gameObject)
    Component:initialize(self, true);
    self.gameObject = gameObject;
end

function RigidBody:update(dt)
    if self.actif then
        -- TODO: Add gravity and mass control
        self.gameObject.transform.position:add(0, 1);
    end
end

return RigidBody
