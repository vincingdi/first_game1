Bullet = {}
Bullet.__index = Bullet

function Bullet:load_bullet() 
    self.bullet_x = 300
    self.bullet_y = 300
    self.bullet_radius = 10
    self.bullet_speed = 500
    self.color = null
end

function Bullet:update_shooting(dt)
    self:move_bullet(dt)
end

function Bullet:move_bullet(dt)
    self.bullet_y = self.bullet_y - self.bullet_speed * dt
end

function Bullet:draw_bullet() 
    love.graphics.setColor(self.color[1], self.color[2], self.color[3])
    love.graphics.circle("fill", self.bullet_x, self.bullet_y, self.bullet_radius)
    love.graphics.setColor(1, 1, 1)
end

function Bullet.new(x, y, direction, color)
    -- Bullet obj constructor. Starting location of bullet x, y and direction. Direction = 1 up and
    -- direction = -1 down
    local instance = setmetatable({}, Bullet)
    instance.bullet_x = x
    instance.bullet_y = y
    instance.bullet_radius = 10
    instance.bullet_speed = 500 * direction
    instance.color = color
    return instance
end