local font = love.graphics.getFont()

CharSquare = {
    positionX = 0, positionY = 0, width = 0, height = 0, plainChar = love.graphics.newText(font, ""), hasCursor = false
}

function CharSquare:new(obj)
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end


function CharSquare.draw(self)
    if not self.hasCursor then
        love.graphics.setColor(255, 255, 255, 1)
    else
        love.graphics.setColor(191,255,0, 1)
    end
    love.graphics.rectangle('line', self.positionX, self.positionY, self.width, self.height, 8, 8)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.draw(self.plainChar, self.positionX + 10, self.positionY)
end

function CharSquare.setText(self, char)
    print("### Drawing ", char, self.positionX, self.positionY)
    self.plainChar:set(char)
end

function CharSquare.cleanText(self)
    self.plainChar:clear()
end

function CharSquare.setCursor(self, value)
    self.hasCursor = value
end
