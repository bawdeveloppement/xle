local Component = require(_G.engineDir .. "middleclass")("Component");

function Component:initialize(actif, forceActif)
    self.forceActif = forceActif or false;
    self.actif = true;
end

function Component:setActif(bool)
    self.actif = bool;
end

return Component