local Vector2 = require(_G.basedir .. "utils.middleclass")("Vector2");

function Vector2:initialize(x, y)
    self.x, self.y = x, y
end

Vector2.static.UP = function (y)
    return Vector2:new( 0, y );
end

Vector2.static.LEFT = function (x)
    return Vector2:new( x, 0 );
end

return Vector2;