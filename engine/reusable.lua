local Class = require(_G.engineDir .. "middleclass");
local Reusable = Class("Reusable");

Reusable.statis.classes = {}

function Reusable:initialize()

end

function Reusable:create(toReuse, parentClass)
    local reuse = Class(toReuse.name, parentClass or nil);
end

function Reusable:doExist()

end

return Reusable