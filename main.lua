
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
    len = 0
    for i=0,6 do
        appart = {}
        appart.width = love.math.random(3, 6)
        appart.height= love.math.random(4, 15)
        if i ~= 0 then
            appart.x = apparts[i].x + apparts[i].width * 10 + love.math.random(1,2) * 10 
            len = len + appart.x
        else
            appart.x = 0
        end
        appart.y = dimy + 10
        table.insert(apparts, appart)
    end

end

function love.update(dt)
    camera.x = (camera.x + 0.1) * (dt + 0.4)
    
    for i, v in ipairs(apparts) do
        v.x = v.x - camera.x
        if v.x < 0 then
            table.remove(apparts, i);
        end
    end     
end


function love.draw()
    love.graphics.print(table.getn(apparts), 0, 0);
    -- Appartement
    for i, v in ipairs (apparts) do
        draw_appart(v.x, v.y, v.width, v.height)
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
end