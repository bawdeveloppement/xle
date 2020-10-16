local Component = require(_G.engineDir .. "middleclass")("Component")

function Component:initialize(data)
    for k, v in pairs(data) do
        if k ~= "$schema" then
            self[k] = v
        end
    end

    print(self.name .. " loaded")
end


return Component