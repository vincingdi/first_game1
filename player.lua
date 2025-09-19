require("shoot_bullets")
-- Inherit shooting
Player = {}
Player.__index = Player
setmetatable(Player, Shoot)


function Player:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.width = 40
    self.height = 40
    self.speed = 800
    self.bullets = {}
end

function Player:update(dt)
    self:move(dt)
    self:checkBoundaries()
    self:shoot_bullet()
    for i = #self.bullets, 1, -1 do
        local bullet = self.bullets[i]
        bullet:move_bullet(dt)
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
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    for _, bullet in ipairs(self.bullets) do
        bullet:draw_bullet()
    end
end 

function Player:shoot_bullet()
    if love.keyboard.isDown("up") then
        table.insert(self.bullets, Bullet.new(self.x, self.y, 1))
    end
end


    