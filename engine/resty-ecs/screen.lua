local Screen = require(_G.engineDir .. "middleclass")("Screen");

Screen.static.screensClasses = {}
Screen.static.screensInstances = {}

function Screen:initialize(name, entities, systems)
    self.name, self.active = name or "unknow", false;

    self.loading = {
        finish = false;
        entities = entities,
        systems = systems
    };

    self.entitiesInstances = {};
    self.systemsInstances = {};

    if #Screen.screensInstances == 0 then self.active = true else self.active = false end
    table.insert(Screen.screensInstances, self);
end

-- Default assets of the screen at this moment
local font = love.graphics.newFont("assets/fonts/Minecraft.ttf")
local title = love.graphics.newText(font, "hello")
local w, h = love.window.getMode();


function Screen:load(...)
    love.window.setVSync(false);
-- function love.load(arg)
--     table.insert(entityInstances, Entity:create(Rogue))
--     for _, v in ipairs(entityInstances) do
--         print(v)
--     end
-- end
end

function Screen:toLoad()
    return #self.loading.entities + #self.loading.systems;
end

function Screen:shouldLoad()
    return self:toLoad() > 0;
end

local currentTimer;

function Screen:update(dt)
    local maxTimer = self:toLoad();
    if currentTimer == nil then currentTimer = maxTimer end
    currentTimer = currentTimer - dt;

    if self:shouldLoad() then
        for index, v in ipairs(self.loading.entities) do
            if currentTimer <= 0 then
                table.insert(self.entitiesInstances, Entity:create(v));
                table.remove(self.loading.entities, index)
            end
        end
        for index, v in ipairs(self.loading.systems) do
            if currentTimer <= 0 then
                table.insert(self.systemsInstances, System:create(v));
                table.remove(self.loading.systems, index)
            end
        end
    else
        for i, v in ipairs(self.systemsInstances) do
            if v["update"] ~= nil and type(v["update"]) == "function" then
                v["update"](v, dt, "dazza");
                -- print(true)
            end
        end
    end
end
-- for _, v in ipairs(callbacks.supported) do
--     print(v)
-- end

Screen.draw = function (self)
   love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)
    local maxTimer = self:toLoad();
    if self:shouldLoad() or not self.loading.finish then
        local barW = w - w * currentTimer / maxTimer
        love.graphics.draw(title, w / 2 - 50, h - 80, 0, 3, 3)
        love.graphics.rectangle("line", 0, h - 40, w, 40)
        love.graphics.rectangle("fill", 0, h - 40, barW, 40)
    end
end

function Screen:keypressed(key)
    if not self:shouldLoad() and not self.loading.finish then
        if key == "space" then self.loading.finish = true end
    end
end

return Screen