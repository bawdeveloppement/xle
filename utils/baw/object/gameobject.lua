local GameObject = require(_G.basedir .. "utils.middleclass")("GameObject");
local Transform = require(_G.basedir .. "utils.baw.components.transform");

GameObject.static.gameobjects = {};

function GameObject:initialize()
    self.debug      = true;
    -- Default
    self.components =  {
        Transform:new(self)
    };
    -- Assign transform by default
    self.transform = self.components[1];
end

function GameObject:setTag(tagName)
    -- we should create a tagList & instantiate a tag in the tag list if when assigning, the tag doesnt exist
    self.tag = tagName;
end

-- Add [parameter]components in GameObject.components
function GameObject:addComponents(components)
    local temp_error    = {}
    local temp_comps    = {}
    for ki, vi in pairs(components) do
        for kj, vj in pairs(self.components) do
            if ki == kj then
                table.insert(temp_error, "Already exist : "..kj)
            else
                table.insert(self.components, vi);
                table.insert(temp_comps, vi);
            end
        end
    end
    return temp_comps;
end

-- GetComponent
function GameObject:getComponent(component)
    local toFind = component.name;
    for k, v in pairs(self.components) do
        if string.match(v.class.name, toFind) then
            return v;
        end
    end
    return nil --"The game object didnt have any components"
end

function GameObject:addComponent(component)
    table.insert(self.components, component:new(self));
end

function GameObject:updateComponents(dt)
    for k, v in ipairs(self.components) do
        if v.update ~= nil then
            v:update(dt)
        end
    end
end

function GameObject:draw()
    for k, v in ipairs(self.components) do
        if v.draw ~= nil then
            v:draw()
        end
    end
end

return GameObject