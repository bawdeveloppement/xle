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
    for i2, v2 in pairs(Entity.entities) do
        print("Entity : "..v2.entityId)
    end
end




function BawEditor:TableToObject(tjson)
    for i, v in pairs(tjson) do
        print(i,v);
    end
end

function BawEditor:update(dt)
    if self.isLoaded == true and self.isLoaded ~= nil then
        for k, v in pairs(Entity.entities) do
            if v.update ~= nil then
                v:update(dt);
            end
        end
    end
end

function BawEditor:draw()
    if self.isLoaded == true and self.isLoaded ~= nil then
        for k, v in pairs(Entity.entities) do
            if v.draw ~= nil then
                v:draw();
            end
        end
    end
end

return BawEditor;
