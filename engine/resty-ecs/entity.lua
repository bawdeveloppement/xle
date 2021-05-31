local Class = require(_G.engineDir .. "middleclass");
local Entity = Class("Entity");

Entity.static.entities = {}

function Entity:initialize()
end

function Entity:getComponent(arg) -- name or class
    for k, v in pairs(self.components) do
        if k == arg then return v end
    end
    return nil
end

function Entity:load()

end

-- Create and Cache the target entity child of EntityClass
function Entity:create(ent)
    -- If the entity don't exist we create the class & return the instance
    if not Entity:doExist(ent) then
        local newEntity = Class(ent.name, Entity);
        newEntity.initialize = function (self, data)
            Entity.initialize(self)
            self.components = {}
            for k, v_cmpt in ipairs(data) do
                self.components[v_cmpt.name] = Component:create(v_cmpt);
            end
        end
        Entity.entities[ent.name] = newEntity;
        return newEntity:new(ent.components)
    else
        return self.entities[ent.name]:new(ent.components)
    end
end

function Entity:doExist(ent)
    for k, v in pairs(Entity.entities) do
        if k == ent.name then
            return true
        end
    end
    return false
end

function Entity:debug()
    print(self.class.name.." "..self.name);
    print("Components [")
    for i, v_cmpt in pairs(self.components) do
        v_cmpt:debug()
    end
    print("]")
end

return Entity