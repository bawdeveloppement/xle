local Screen = require(_G.engineDir .. "middleclass");

function Screen:initialize()
    self.entities = {};
    self.systems = {};
end

return Screen