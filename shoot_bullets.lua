Shoot = {}
MetaShoot = {} 
MetaShooting.__index = Shoot

function Shoot:load_bullet() 
    self.x = 300
    self.y = 300
    self.radius = 10
    self.speed = 500
end


function Shoot:update(dt)
    self:move_bullet(dt)
end

function Shoot:move_bullet(dt)
    self.y = self.y - self.speed * dt
end

function Shoot:draw_bullet() 
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.setColor(1, 1, 1)
end