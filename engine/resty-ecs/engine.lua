local Engine = require(_G.engineDir .. "middleclass")("Engine");

local Json = require(_G.engineDir .. "json");

function Engine:initialize(path)
    self.Component = require(_G.engineDir .. "resty-ecs.component");
    self.Entity = require(_G.engineDir .. "resty-ecs.entity");
    self.System = require(_G.engineDir .. "resty-ecs.system");

    self.path = path or "engine/resty-ecs/"
    self:loadFiles();
end

function Engine:loadFiles()
    print("[LEE] Checks json files")
    local checks = { "components", "entities", "screens", "systems" }
    for k, v in pairs(checks) do
        print(v:upper()..": "..#love.filesystem.getDirectoryItems(self.path..v).." file")
        for key_file, value_file in pairs(love.filesystem.getDirectoryItems(self.path..v)) do
            local content, size = love.filesystem.read(self.path..v.."/"..value_file)
            local decoded_data = Json:decode(content);
            if v == "components" then
                self:loadComponent(decoded_data)
            end
            if v == "entities" then
                self:loadEntity(decoded_data)
            end
            if v == "systems" then
                self:loadSystem(decoded_data)
            end
        end
    end
end

function Engine:loadScreens()
    -- Search the default screens
end

function Engine:loadComponent(cmpt)
    local obj = self.Component:new(cmpt);
end

function Engine:loadEntity(ent)
    local obj = self.Entity:new(ent)
end

function Engine:loadSystem(sys)
    local obj = self.System:new(sys);
end

return Engine