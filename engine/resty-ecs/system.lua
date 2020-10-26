local System = require(_G.engineDir .. "middleclass")("System");

function System:initialize(data)
    for k, v in pairs(data) do
        if k ~= "$schema" then
            if k == "callbacks" then
                for is, vs in ipairs(v) do
                    self:setupCallback(vs)
                end
            else
                self[k] = v
                print(k, v)
            end
        end
    end
    print("[LEE] Entities")
    for index, entity in ipairs(_G.Engine.Entity.entities) do
        self:debugEntity(entity)
    end
    table.insert(System.entities, self);
end

System.static.entities = {}

function System:setupCallback(callback)
    for kc, vc in pairs(callback) do
        print(vc)
    end
end

function System:debugEntity(entity)
    entity:debug()
end

return System;