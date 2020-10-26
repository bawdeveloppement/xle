local Entity = require(_G.engineDir .. "middleclass")("Entity");

function Entity:initialize(data, components)
    for k, v in pairs(data) do
        if k ~= "$schema" and k ~= "components" then
            self[k] = v
        elseif k == "components" then
            self:assignComponent(v)
        end
    end

    print(self.name .. " loaded")
end

function Entity:assignComponent(cmpt)
    for k, v in pairs(cmpt) do
        self[v.name:lower()] = v
        print(k, v)
    end
end

function Entity:debug()
    print(self.name.." {")
    for k_entity, v_entity in pairs(self) do
        if type(v_entity) == "table" and k_entity == "position" then
            print(v_entity.name)
            print("\t".."Components {")
            for k, v in pairs(v_entity) do
                print("\t\t"..k, v);
            end
            print("\t}")
        end
    end
    print("}")
end

return Entity