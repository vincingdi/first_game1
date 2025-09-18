Enemy = {}

function Enemy:load()
    self.x = love.graphics.getWidth()/2
    self.y = 50
    self.height = 40
    self.width = 40
    self.directionRight = true --direction variable, by default the enemy goes to the right
    self.speed = 800
end

function Enemy:update(dt)
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
end