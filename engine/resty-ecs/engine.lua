local Engine = require(_G.engineDir .. "middleclass")("Engine");


function Engine:initialize()
    self.screens = self:loadScreen();
end

function Engine:loadScreen()
    -- Seach the default screens
    
end

return Engine