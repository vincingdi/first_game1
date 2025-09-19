require("bullet")


Enemy = {}  
Enemy.__index = Enemy
setmetatable(Enemy, Bullet)

function Enemy:load()
    self.x = love.graphics.getWidth()/2
    self.y = 50
    self.height = 40
    self.width = 40
    self.directionRight = true --direction variable, by default the enemy goes to the right
    self.speed = 800
    self.bullets = {}
    self.bulletTimer= 0
end

function Enemy:update(dt)
    self.bulletTimer = self.bulletTimer + dt

    if self.bulletTimer > 0.3 then
        Enemy:shootBullet()
        self.bulletTimer = 0
    end

    for i = #self.bullets, 1, -1 do
        local bullet = self.bullets[i]
        bullet:move_bullet(dt)
        -- Remove bullet if off screen
        if bullet.bullet_y + bullet.bullet_radius < 0 then
            table.remove(self.bullets, i)
        end
    end





    self:checkBoundaries()
    self:move(dt)
end

function Enemy:move(dt)
    if(self.directionRight) then
        self.x = self.x + self.speed * dt
    else
        self.x = self.x - self.speed * dt
    end
end

function Enemy:checkBoundaries()
    if self.x + self.width > love.graphics.getWidth() then
        self.directionRight = false
    elseif  self.x < 0 then
        self.directionRight = true
    end
end

function Enemy:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(1, 1, 1) --changing back the default color to white
    for _, bullet in ipairs(self.bullets) do
        bullet:draw_bullet()
    end
end

function Enemy:shootBullet() 
    table.insert(self.bullets, Bullet.new(self.x+self.width, self.y+self.height, -1, {0, 1, 0}))
end