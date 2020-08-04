local Camera    = require(_G.basedir .. "utils.baw.object.primitives.camera").Default.config
local Appart    = require(_G.basedir .. 'prefabs.appart')
local City      = require(_G.basedir .. 'utils.middleclass')('City')

--[[
    Ici on génere la ville entiére
]]--

function City:initialize(w, y, color, scale, debug)
    -- Properties
    self.world = love.physics.newWorld(0, 9.81*50, true);
    self.width = w;
    self.y = y;
    self.color = color or { 50/255, 50/255, 48/255, 1 };
    self.appart_scale = scale or 20
    self.debug = debug or false
    self.direction = -1 -- Direction for parallax Scrolling
    -- End Properties

    -- Ground
    self.ground = {}
    self.ground.y = y
    self.ground.w = w
    self.ground.h = 40
    self.ground.body = love.physics.newBody(self.world, 0, y - 40)
    self.ground.shape = love.physics.newRectangleShape(w, 40)
    self.ground.fixture = love.physics.newFixture(self.ground.body, self.ground.shape)
    self.ground.color = { 60/255,89/255,102/255, 1}
    -- EndGround

    -- Generation Appart
    self.apparts = {}
    local tempw = 0;
    local i = 1
    while tempw < w do
        table.insert(self.apparts, Appart:new(tempw - Camera.x, self.ground.y - self.ground.h, self.color, self.appart_scale))
        tempw = tempw + (self.apparts[i].w * self.appart_scale) + self.apparts[i].space
        i = i + 1
    end
    -- End Generation
end

function City:update(dt)
    self.world:update(dt);
    for i,v in ipairs(self.apparts) do
        if self.direction < 0 then
            v:update(dt, Camera.x)
        else
            v:update(dt, -Camera.y)
        end
    end
    -- Récupére la position + la largeur du dernier appart
    local apparts_count= table.getn(self.apparts)
    local last_appartx = self.apparts[apparts_count].x
    + self.apparts[apparts_count].w * self.appart_scale + self.apparts[apparts_count].space;
    
    -- Self.ground.w fais référence à la taille de l'écran
    -- Nom de variable à changer en window.x
    if last_appartx < self.ground.w then
        table.insert(self.apparts, Appart:new(last_appartx, self.ground.y - self.ground.h, self.color, self.appart_scale))
    end

    -- Go supprimé le premier appart lorsque la position x + sa largeur est inférier à 0
    if self.apparts[1].x + self.apparts[1].w * self.appart_scale < 0 then
        table.remove(self.apparts, 1)
    end
end

function City:draw()
    if self.debug then
        love.graphics.setColor(1,1,1,1)
        love.graphics.print("Camera X : " .. Camera.x,0,0)
        love.graphics.print("Appart count : " .. table.getn(self.apparts),0,15)
        love.graphics.print("Pos Appart[1] : " .. self.apparts[1].x + self.apparts[1].w * self.appart_scale,0,30)
    end
    love.graphics.setColor(self.ground.color);
    love.graphics.rectangle("fill", 0, self.ground.y - self.ground.h, self.ground.w, self.ground.h)
    for i,v in ipairs(self.apparts) do
        v:draw()
    end
end

return City;