require("player")
require("enemy")
require("victory_screen")

function love.load()
    number = 0

    Player:load()
    Enemy:load()
end


function love.update(dt)
    number = number + 1

    Player:update(dt)
    Enemy:update(dt)
end

function love.draw()
    love.graphics.print(number +1)

    Player:draw()
    Enemy:draw()
end
