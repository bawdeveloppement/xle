local SceneManager  = require(_G.engineDir .. "baw.object.manager"):new();
local Scene         = require(_G.componentDir .. "scene")
local MainScene     = require(_G.engineDir .. "middleclass")("MainScene", Scene)

-- Le nom de la class sera utiliser pour changer de scene
function MainScene:initialize(gameobjects)
    Scene.initialize(self, MainScene.name, "Un rendez-vous") -- Gére le chargement des objects
end

function MainScene:update(dt)
    Scene.update(self, dt)
    if self.loaded then
    end
end

function MainScene:draw()
    Scene.draw(self)
    if self.loaded == true then
        
    end
end

return MainScene