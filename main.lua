function love.load()
    number = 0
end


function love.update(dt)
    number = number + 2
end

function love.draw()
    love.graphics.print(number +1)
end 

--test :D