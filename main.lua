require("player")
require("enemy")
require("victory_screen")
require("shoot_bullets")

function love.load()
    Player:load()
    Enemy:load()
    -- Player:load_bullet()
    Player:load_bullet()
end

function love.update(dt)
    Player:update(dt)
    Enemy:update(dt)
    -- Player:update_shooting(dt)
    Player:update_shooting(dt)
end

function love.draw()
    Player:draw()
    Enemy:draw()
    -- Player:draw_bullet()
    Player:draw_bullet()
end
