local Camera    = require(_G.enginedir .. "middleclass")('Camera')

function Camera:initialize()
    self.config = {
        x = 0
    }
end

function Camera:update(dt)
    self.config.x = 1
end

function CameraUpdateValue (table)
    if type(table) ~= "table" then
        print("You should put a table as parameter[1].");
        return false
    end
end

-- Prevent Multi/Instanciage --
local DefaultInstance = Camera:new();
-- End
return {
    Camera = Camera,
    Default = DefaultInstance,
    Instances = {}
}