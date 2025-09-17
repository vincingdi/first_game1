require("player")

function love.load()
    number = 0

    Player:load()
end


function love.update(dt)
<<<<<<< Updated upstream
    number = number + 2
end

function love.draw()
    love.graphics.print(number)
end 

--test :D
=======
    number = number + 1

    Player:update(dt)
end

function love.draw()
    love.graphics.print(number +1)

    Player:draw()
end
>>>>>>> Stashed changes
