local BawEditor = require(_G.engineDir .. "middleclass")("BawEditor");
local Json      = require(_G.engineDir .. "json");
local Entity    = require(_G.engineDir .. "baw.Entity");

local Player;
function BawEditor:initialize()
    print("[BE] Initialisation");
    
    local content, size = love.filesystem.read("assets/prefabs/player.entity.json");
    local decoded = Json.decode(content);
    self:TableToObject(decoded);
    Player = Entity:new(decoded.entityId, decoded.components, decoded.hooks)
    print("[BE] ENTITIES");
    print("Entities "..table.getn(Entity.entities));
    -- for i, v in ipairs(Entity.entities) do
        
    -- end
    for i2, v2 in ipairs(Entity) do
        print(i2)
    end
end
    
function BawEditor:TableToObject(tjson)
    for i, v in pairs(tjson) do
        print(i,v);
    end
end

function BawEditor:update(dt)
    Player:update(dt)
    -- for ei, ev in ipairs(Entity.entities) do
    --     print(ev);
    -- end
end

function BawEditor:draw()

end

return BawEditor;
