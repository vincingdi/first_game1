require("bullet")
-- Inherit shooting
Player = {}
Player.__index = Player
setmetatable(Player, Bullet)


function Player:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 40
    self.height = 40
    self.speed = 800
    self.bullets = {}
    self.bulletTimer = 0
end

function Player:update(dt)

    -- Timer to make bullets fly in with a slight delay one after the other
    self.bulletTimer = self.bulletTimer + dt
    
    if self.bulletTimer > 0.2 then
        self:shoot_bullet()
        self.bulletTimer = 0
    end


    self:move(dt)
    self:checkBoundaries()
    for i = #self.bullets, 1, -1 do
        local bullet = self.bullets[i]
        bullet:move_bullet(dt)
        -- Remove bullet if off screen
        if bullet.bullet_y + bullet.bullet_radius < 0 then
            table.remove(self.bullets, i)
        end
    end
end

function Player:move(dt)
    --vertical movement
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y = self.y + self.speed * dt
    end
    --horizontal movement
    if love.keyboard.isDown("a") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("d") then
        self.x = self.x + self.speed * dt
    end
end

function Player:checkBoundaries()
    --vertical check
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
    --horizontal check
    if self.x < 0 then
        self.x = 0
    elseif self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() - self.width
    end
end

function Player:draw()
    self.bulletTimer = self.bulletTimer + 1
    


    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    for _, bullet in ipairs(self.bullets) do
        if self.bulletTimer > 0.5 then
            bullet:draw_bullet()
            self.bulletTimer = 0
        end
    end
end 

function Player:shoot_bullet()
    if love.keyboard.isDown("up") then
        table.insert(self.bullets, Bullet.new(self.x + self.width / 2, self.y, 1))
    end
end


    