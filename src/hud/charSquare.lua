CharSquare = {}

local font = love.graphics.getFont()


function CharSquare.draw(positionX, positionY, width, height)
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.rectangle('line',
        positionX, positionY,
        width, height)
end

function CharSquare.setText(char)
    plainChar = love.graphics.newText(font, char)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.draw(char, CharSquare.positionX, CharSquare.positionY)
end
