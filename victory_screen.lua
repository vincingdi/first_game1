VictoryScreen = {}

function VictoryScreen:load()
    victory_royale = love.graphics.newImage("victory_royale.jpg")
end

function VictoryScreen:draw() 
    love.graphics.clear()
    love.graphics.draw(victory_royale, 100, 100)

end