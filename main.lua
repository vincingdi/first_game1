require("player")
require("enemy")
require("victory_screen")

function love.load()
    Player:load()
    Enemy:load()
end

function love.update(dt)
    Player:update(dt)
    Enemy:update(dt)
 
end

function love.draw()
    Player:draw()
    Enemy:draw()
end
