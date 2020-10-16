local Engine = require(_G.engineDir .. "middleclass")("Engine");
local Component = require(_G.engineDir .. "resty-ecs.component");
local Entity = require(_G.engineDir .. "resty-ecs.entity");
local Json = require(_G.engineDir .. "json");

function Engine:initialize(path)
    self.path = path or "engine/resty-ecs/"
    self.screens = {}
    self.components = {}
    self.entities = {}
    self.systems = {}

    self:loadFiles();
end

function Engine:loadFiles()
    print("[LEE] Checks json files")
    local checks = { "components", "entities", "screens", "systems" }
    for k, v in pairs(checks) do
        print("[LEE] "..v..": "..#love.filesystem.getDirectoryItems(self.path..v).." file")
        for kf, vf in pairs(love.filesystem.getDirectoryItems(self.path..v)) do
            local content, size = love.filesystem.read(self.path..v.."/"..vf)
            local decoded_data = Json:decode(content);
            if v == "components" then
                self:loadComponent(decoded_data)
            end
            if v == "entities" then
                self:loadEntity(decoded_data)
            end
        end
    end
end

function Engine:loadScreens()
    -- Search the default screens
end

function Engine:loadComponent(cmpt)
    local obj = Component:new(cmpt);
    table.insert(self.components, obj)
end

function Engine:loadEntity(ent)
    local obj = Entity:new(ent, self.components)
    table.insert(self.components, obj)
end

return Engine