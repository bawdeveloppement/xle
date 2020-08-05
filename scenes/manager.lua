local SceneManager  = require(_G.basedir .. "utils.middleclass")("SceneManager")
local Scene = require(_G.basedir .. "scenes.scene");

function SceneManager:initialize(scene)
    self.scenes = {
        default = scene or Scene:new()
    }
    self.current = "default"
end

function SceneManager:update(dt)
    self.scenes[self.current]:update(dt);
end

function SceneManager:draw()
    self.scenes[self.current]:draw();
end

return SceneManager