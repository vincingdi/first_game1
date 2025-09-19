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
end

function Player:update(dt)
    self:move(dt)
    self:checkBoundaries()
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
end

-- Change inheritence of bullet
function Player:load_bullet()
    bullet_x = self.x
    bullet_y = self.y
    bullet_speed = 500
    bullet_radius = 10
end                 

function Player:draw_bullet() 
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", bullet_x, bullet_y, bullet_radius)
    love.graphics.setColor(1, 1, 1)
end


function Player:move_bullet(dt)
    bullet_y = bullet_y - bullet_speed * dt
end



    