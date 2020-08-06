local SceneManager  = require(_G.basedir .. "scenes.manager"):new();
local Scene         = require(_G.basedir .. "scenes.scene")
local MainScene     = require(_G.basedir .. "utils.middleclass")("MainScene", Scene)

-- Le nom de la class sera utiliser pour changer de scene
function MainScene:initialize()
    Scene.initialize(self, MainScene.name, "Un rendez-vous")
end

function MainScene:update(dt)
    Scene.update(self, dt)
    if self.loaded then
    end
end

function MainScene:draw()
    Scene.draw(self)
    if self.loaded == true then
        love.graphics.setColor(1,1,1,1)
        love.graphics.print(self.name, 0, 0)
    end
end

return MainScene