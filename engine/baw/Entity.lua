local Entity = require(_G.engineDir .. "middleclass")("Entity");

local ComponentList = {
    require(_G.componentDir .. "transform"),
    require(_G.componentDir .. "text"),
    require(_G.componentDir .. "rigidbody"),
    require(_G.componentDir .. "component")
}

Entity.static.entities = {};

function Entity:initialize(entityId, components, hooks)
    self.entityId, self.components, self.hooks = nil, {}, {};

    if entityId == nil then error("Entity can not be initialised empty entityId") end
    if components ~= nil then self:addComponents(components); end
    if hooks ~= nil then self:addHooks(hooks); end

    table.insert(Entity.entities, self);
    return self;
end

function Entity:addComponent(componentId)
    table.insert(self.components, ComponentList[componentId]:new(self));
end

function Entity:addComponents(cmpts)
    print("[BE] COMPONENTS : "..table.getn(ComponentList))
    for i, v in ipairs(ComponentList) do
        print(v.name)
    end
    print("[BE] ADDING COMPONENTS");
    if cmpts ~= nil then

        local getComponentIndex = function (tab, name)
            local index = {}
            for k, v in ipairs(tab) do
                index[v.name] = k
            end
            return index[name]
        end
        -- Search in arg in given components
        for k, v in pairs(cmpts) do
            -- If the component list of this entity isnt null
            -- Or the length isnt equals to 0
            -- We will check if the given component is already setup
            if self.components ~= nil and table.getn(self.components) ~= 0 then
                for k2, v2 in pairs(self.components) do
                    if v.componentId == v2.class.name then
                        error("The component"..v.componentId.." already exits.", 2)
                    else
                        local iv1 = getComponentIndex(ComponentList, v.componentId);
                        if iv1 ~= nil then
                            table.insert(self.components, ComponentList[iv1]:new(self, v.data))
                        end
                    end
                    print(v2.class.name)
                end
            else
                for i2, v2 in ipairs(ComponentList) do
                    if v2.name == v.componentId then
                        table.insert(self.components, ComponentList[i2]:new(self, v.data))
                    end
                end
            end

        end
    else
        error("Argument of addComponents is null", 2);
    end
end


function Entity:addHooks(hooks)
    print("[BE] ADD HOOKS")
    -- Here we will analize if the events object from the json
    -- file doesnt contain twice event with the same id in the
    -- same event_hook
    -- if we found one we result in an error
    for i, v in ipairs(hooks) do
        local count = 0;
        for i2=1, table.getn(hooks) do
            if hooks[i2].hookId == v.hookId then count = count + 1 end
        end
        if count > 1 then error("Sorry you can't provide two hook with same id, try to group the events in the same hooks") end
        table.insert(self.hooks, v);
    end
    print("Hooks " .. table.getn(self.hooks))
end

function Entity:update(dt)
    if self.components ~= nil then
        for k, v in ipairs(self.components) do
            if v.update ~= nil then
                v:update(dt)
            end
        end
    end
    if self.hooks ~= nil and table.getn(self.hooks) ~= 0 then
        for i, v in ipairs(self.hooks) do
            if v.hookId == "on_update" then
                for ievent, vevent in ipairs(v.events) do
                    print(vevent.eventId)
                end
            end
        end
    end
end

function Entity:draw()
    if self.components ~= nil then
        for k, v in ipairs(self.components) do
            if (v.draw ~= nil) then
                v:draw()
            end
        end
    end
end

return Entity;