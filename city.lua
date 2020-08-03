local Camera    = require("camera")
local Appart    = require('appart')
local City      = require('middleclass')('City')

--[[
    Ici on génere la ville entiére
]]--

function City:initialize(w, y)
    -- Ground
    self.ground = {}
    self.ground.y = y
    self.ground.w = w
    self.ground.h = 40
    -- EndGround
    
    -- Generation Appart
    self.apparts = {}
    local tempw = 0;
    local i = 1
    while tempw < w do
        table.insert(self.apparts, Appart:new(tempw - Camera.x, self.ground.y - self.ground.h, love.math.random(3, 6)))
        tempw = tempw + (self.apparts[i].w * 20) + self.apparts[i].space
        i = i + 1
    end
    -- End Generation
end
local count = 0
function City:update(dt)
    for i,v in ipairs(self.apparts) do
        v:update(dt, Camera.x)
    end
    -- Récupére la position + la largeur du dernier appart
    local apparts_count= table.getn(self.apparts)
    local last_appartx = self.apparts[apparts_count].x
    + self.apparts[apparts_count].w * 20 + self.apparts[apparts_count].space;
    
    -- Self.ground.w fais référence à la taille de l'écran
    -- Nom de variable à changer en window.x
    if last_appartx < self.ground.w then
        table.insert(self.apparts, Appart:new(last_appartx, self.ground.y - self.ground.h, love.math.random(3, 5)))
        count = count + 1
    end

    -- Go supprimé le premier appart lorsque la position x + sa largeur est inférier à 0
    if self.apparts[1].x + self.apparts[1].w * 20 < 0 then
        table.remove(self.apparts, 1)
    end
end

function City:draw()
    love.graphics.setColor(1,1,1,1)
    love.graphics.print("Camera X : " .. Camera.x,0,0)
    love.graphics.print("Appart count : " .. table.getn(self.apparts),0,15)
    love.graphics.print("Pos Appart[1] : " .. self.apparts[1].x + self.apparts[1].w * 20,0,30)
    love.graphics.setColor(60/255,89/255,102/255,1);
    love.graphics.rectangle("fill", 0, self.ground.y - self.ground.h, self.ground.w, self.ground.h)
    for i,v in ipairs(self.apparts) do
        v:draw()
    end
end

return City;