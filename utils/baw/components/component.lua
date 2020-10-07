local Component = require(_G.basedir .. "utils.middleclass")("Component");

function Component:initialize(actif, forceActif)
    self.forceActif = forceActif or false;
    self.actif = true;
end

function Component:setActif(bool)
    self.actif = bool;
end

return Component