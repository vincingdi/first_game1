Shoot = {}
Shoot.__index = Shoot

function Shoot:load_bullet() 
    bullet_x = 300
    bullet_y = 300
    bullet_radius = 10
    bullet_speed = 500
end


function Shoot:update_shooting(dt)
    self:move_bullet(dt)
end

function Shoot:move_bullet(dt)
    bullet_y = bullet_y - bullet_speed * dt
end

function Shoot:draw_bullet() 
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", bullet_x, bullet_y, bullet_radius)
    love.graphics.setColor(1, 1, 1)
end