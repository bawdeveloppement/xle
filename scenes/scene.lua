local Scene = require(_G.basedir .. "utils.middleclass")("Scene")

function Scene:initialize(name, title)
    self.name = name
    self.font = love.graphics.newFont("/sprites/Jorolks.ttf");
    self.title = love.graphics.newText(self.font, title)
    self.loaded = false
    self.background = { 0, 0, 0, 1}
end

local sliderbar = 0
local timer = 50
local sliderbarpercent = timer
function Scene:update(dt)
    if timer > 0 then
        timer = timer - (dt * 10)
        sliderbar = self.title:getWidth() * (100 * (sliderbarpercent - timer) / self.title:getWidth()) / 100;
    else
        self.loaded = true
    end
end

local width, height = love.window.getMode()
function Scene:draw()
    if self.loaded == false then
        love.graphics.setColor(self.background);
        love.graphics.rectangle(
            "fill",
            0,
            0,
            width,
            height
        );
        love.graphics.setColor(1,1,1,1)
        love.graphics.draw(
            self.title, 
            width / 2 - self.title:getWidth(), 
            height / 2 - self.title:getHeight(), 
            0, 
            2, 
            2
        );
        love.graphics.rectangle(
            "line", 
            width / 2 - self.title:getWidth(),
            height / 2 + self.title:getHeight() * 1.5,
            self.title:getWidth() * 2,
            self.title:getHeight()
        );
        love.graphics.rectangle(
            "fill", 
            width / 2 - self.title:getWidth(),
            height / 2 + self.title:getHeight() * 1.5,
            sliderbar,
            self.title:getHeight()
        );
        love.graphics.print(sliderbar)
    end
end

return Scene;