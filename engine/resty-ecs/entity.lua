local Entity = require(_G.engineDir .. "middleclass")("Entity");

function Entity:initialize(data)
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
    for k, v in ipairs(cmpt) do
        self[v.name:lower()] = v.data
    end
end

return Entity