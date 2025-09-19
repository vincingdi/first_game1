require("player")
require("enemy")
require("victory_screen")
require("shoot_bullets")

function love.load()
    Player:load()
    Enemy:load()
    Shoot:load_bullet()
end

function love.update(dt)
    Player:update(dt)
    Enemy:update(dt)
    Shoot:update(dt)
end

function love.draw()
    Player:draw()
    Enemy:draw()
    Shoot:draw_bullet()
end
