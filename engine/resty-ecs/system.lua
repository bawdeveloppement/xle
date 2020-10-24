local System = require(_G.engineDir .. "middleclass")("System");

function System:initialize(data, entities)
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
    for i, v in ipairs(entities) do
        for ke, ve in pairs(v) do
            print(ke, ve)
        end
    end
end

function System:setupCallback(callback)
    for kc, vc in pairs(callback) do
        print(vc)
    end
end

return System;