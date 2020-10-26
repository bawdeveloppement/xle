local Class = require(_G.engineDir .. "middleclass");
local Component = Class("Component")

Component.static.components = {}

function Component:initialize()
    -- Component:create(cmpt)
end

function Component:debug()
    print("\t"..self.class.name.." {")
    for k, v in pairs(self.data) do
        if type(v) == "table" then
            print("\t\t"..k.." {")
            for dk, dv in pairs(v) do
                print("\t\t\t"..dk..": "..dv)
            end
            print("\t\t}")
        else
            print("\t\t"..k, v)
        end

    end
    print("\t}")
end

-- Create a child of Component dynamically
function Component:create(cmpt)
    if not Component:doExist(cmpt) then
        local newComponent = Class(cmpt.name, Component);
        newComponent.initialize = function (self, data)
            Component.initialize(self)
            self.data = data
        end
        Component.components[cmpt.name] = newComponent;
        return newComponent:new(cmpt.data)
    else
        return self.components[cmpt.name]:new(cmpt.data)
    end
end

function Component:doExist (cmpt)
    for k, v in pairs(self.components) do
        if k == cmpt.name then
            return true
        end
    end
    return false
end

return Component