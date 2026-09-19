local font = love.graphics.getFont()
CharSquare = {
    positionX = 0, positionY = 0, width = 0, height = 0, plainChar = nil
}

function CharSquare:new(obj)
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end


function CharSquare.draw(self)
    love.graphics.setColor(255, 255, 255, 1)
    love.graphics.rectangle('line', self.positionX, self.positionY, self.width, self.height)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.draw(plainChar, self.positionX, self.positionY)
end

function CharSquare.setText(self, char)
    print("### Drawing ", char, self.positionX, self.positionY)
    self.text = char
end
