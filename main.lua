
player = {}
player.x = 0;
player.y = 0;

camera = {}
camera.x = 0

function love.load()
    love.window.setMode(400, 400);
    dimx, dimy = love.window.getMode();
    cx, cy = dimx / 2, dimy / 2;
    sx, sy = 0, dimy;

    -- Init Appartements
    apparts = {}
    for i=0,5 do
        appart = {}
        appart.width = love.math.random(3, 6)
        appart.height= love.math.random(4, 15)
        if i ~= 0 then
            appart.x = apparts[i].x + apparts[i].width * 10 + love.math.random(1,2) * 10 
        else
            appart.x = 0
        end
        appart.y = dimy + 10
        table.insert(apparts, appart)
    end

end

function love.update(dt)
    camera.x = camera.x + 10 * dt
    for i=0, v in ipairs(apparts) do
    end
end

max_appart = 1
current_appart = 0
lastx = 0
lastwidth = love.math.random(3, 5)
lastheight= love.math.random(4, 15)
lastwidth2 = love.math.random(3, 5)
lastheight2= love.math.random(4, 15)

appartdrawn = false
function love.draw()
    -- Appartement
    for i, v in ipairs (apparts) do
        local ce = v.x + 10
        if i == 1 then draw_appart(ce - camera.x, v.y, v.width, v.height)
        else draw_appart(v.x + 10 - camera.x, v.y, v.width, v.height) end
    end
    -- Fin Appartement
end

function draw_ville ()
end

function draw_appart (x, y, width, height)
    love.graphics.setColor(0.9, 0.9, 0.9, 1);
    local i = 0
    local j = 0
    while i < height do
        j = 0
        while j < width do
            love.graphics.line(x + j * 10, y - i * 10, x + j * 10, y -  (i * 10 + 10))
            love.graphics.line(x + j * 10, y - i * 10, x + j * 10 + 10, y - i * 10)
            if i ~= height - 1 then
                love.graphics.line(x + j * 10 + 10, y - (i * 10 + 10), x + j * 10 + 10, y - i * 10)
            end
            if j ~= width - 1 then
                love.graphics.line(x + j * 10 + 10, y - (i * 10 + 10), x + j * 10, y - (i * 10 + 10))
            end
            if j == width - 1 and i == height - 1 then
                love.graphics.line(x + j * 10 + 10, y - (i * 10 + 10), x + j * 10, y - (i * 10 + 10))
                love.graphics.line(x + j * 10 + 10, y - (i * 10 + 10), x + j * 10 + 10, y - i * 10)
            end
            j = j + 1
        end
        i = i + 1
    end
    return 1
end