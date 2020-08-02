appart = {
    x, y = 0, 0;
    w, h = love.math.random(3, 10), love.math.random(4, 20);

    init = function (...) -- ... = arg 
        
    end

    update = function (dt)
    end

    draw = function ()
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
}

return appart;

function appart:load()
end

function appart:update()
end

function appart:draw()
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

return apparts;