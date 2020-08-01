
player = {}
player.x = 0;
player.y = 0;

function love.load()
end

function love.update(dt)
    if love.keyboard.isDown("z") then
        player.y = player.y - 50 * dt; -- DT = Delta Time
    end
    if love.keyboard.isDown("s") then
        player.y = player.y + 50 * dt;
    end
    if love.keyboard.isDown("q") then
        player.x = player.x - 50 * dt;
    end
    if love.keyboard.isDown("d") then
        player.x = player.x + 50 * dt;
    end
end

function love.draw()
    love.graphics.setColor(1,1,1,1);
    love.graphics.rectangle("fill", player.x, player.y, 30, 30);
end