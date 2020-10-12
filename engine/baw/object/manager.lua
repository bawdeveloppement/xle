local SceneManager  = require(_G.engineDir .. "middleclass")("SceneManager")
local Scene = require(_G.componentDir .. "scene");

SceneManager.static.scenes = {}

function SceneManager:initialize(scene)
    if scene ~= nil then
        table.insert(SceneManager.scenes, scene)
    end
    self.current = 1
end

function SceneManager:update(dt)
    if table.getn(SceneManager.scenes) >= 1 then
        SceneManager.scenes[self.current]:update(dt);
    end
end

function SceneManager:register(scene)
    table.insert(SceneManager.scenes, scene);
end

function SceneManager:draw()
    local count = 1
    if table.getn(SceneManager.scenes) >= 1 then
        SceneManager.scenes[self.current]:draw();
    end
    -- for k, v in pairs(SceneManager.scenes) do
    --     love.graphics.print(v.name, 0, count * 15);
    --     count = count + 1
    -- end
end

function SceneManager:changeScene(scenename)
    local count = 1
    if table.getn(SceneManager.scenes) > 2 then
        for k, v in pairs(SceneManager.scenes) do
            if v.name == scenename then
                self.current = count
            end
            count = count + 1
        end
    end
end

return SceneManager