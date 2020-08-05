local Scene = require(_G.basedir .. "utils.middleclass")("Scene")

Scene.static.current = {}
Scene.static.scenes = {}

function Scene:initialize(iscurrent)
    -- Add the current scenes to list of scenes
    if table.getn(self.scenes) < 1 then
        table.insert(self.scenes, self);
        self.current[1] = self.scenes[1];
    end
    -- End scenes list
end

function Scene:update(dt)
end

function Scene:draw()
end

function Scene:keypressed(key, scancode, isrepeat)
    -- Change Scenes
    if key == "+" then
        self:changescene(next(self.scenes, self.current))
    end
end

return Scene;