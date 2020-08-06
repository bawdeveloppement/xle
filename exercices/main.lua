-- Exercices --
-- Exercices --
local dimx, dimy
local player = {}
function love:load()
    love.window.setMode(800, 600)
    dimx, dimy = love.window.getMode()

    player.w = 50
    player.h = 50
    player.x = dimx/2 - player.w/2
    player.y = dimy/2 - player.h/2

end

function love:update(dt)
    if love.keyboard.isDown("left") then
        player.x = player.x - 20 * dt

    elseif love.keyboard.isDown("right") then
        player.x = player.x + 20 * dt
    end
end

function love:draw()
    love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end