require("src.hud.charSquare")

local font = love.graphics.newFont(50, "mono")
Board = {
    lines = 6,
    columns = 5,
    startX = 50,
    startY = 50,
    gapX = 10,
    gapY = 10,
    size = 70,
    boardMatrix = {
        { nil, nil, nil, nil, nil },
        { nil, nil, nil, nil, nil },
        { nil, nil, nil, nil, nil },
        { nil, nil, nil, nil, nil },
        { nil, nil, nil, nil, nil },
        { nil, nil, nil, nil, nil }
    },
    word = { "", "", "", "", "" },
    currentLine = 1,
    cursor = 1
}

function Board:new(obj)
    obj = obj or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function Board.mount(self)
    for i = 1, self.lines, 1 do
        for j = 1, self.columns, 1 do
            local positionX = j * (self.size + self.gapX) + self.startX
            local positionY = i * (self.size + self.gapY) + self.startY
            local hasCursor = false
            if self.cursor == j and self.currentLine == i then
                hasCursor = true
            end
            local charSqr = CharSquare:new({ positionX = positionX, positionY = positionY, width = 70, height = 70, plainChar =
            love.graphics.newText(font, ""), hasCursor = hasCursor })
            self.boardMatrix[i][j] = charSqr
        end
    end
end

function Board.draw(self)
    for i = 1, #self.boardMatrix, 1 do
        for j = 1, #self.boardMatrix[i], 1 do
            charSqr = self.boardMatrix[i][j]
            charSqr:draw()
        end
    end
end

function Board.updateWord(self, char)
    local len = #self.word
    print("Length = ", len, " cursor = ", self.cursor)
    self.word[self.cursor] = char
    local sqr = self.boardMatrix[self.currentLine][self.cursor]
    sqr:setText(char)
    self:moveCursor("next")
    print(table.concat(self.word, ", "))
end

function Board.removeWord(self)
    self.word[self.cursor] = ""
    local sqr = self.boardMatrix[self.currentLine][self.cursor]
    sqr:cleanText()
    self:moveCursor("back")
    print(table.concat(self.word, ", "))
end

function Board.updateSqrCursor(self, value)
    local sqr = self.boardMatrix[self.currentLine][self.cursor]
    sqr:setCursor(value)
end

function Board.moveCursor(self, step)
    self:updateSqrCursor(false)

    if step == "next" then
        self.cursor = math.min(5, self.cursor + 1)
    elseif step == "back" then
        self.cursor = math.max(1, self.cursor - 1)
    end

    self:updateSqrCursor(true)
end

function Board.submitLine(self)
    -- TODO: Validate word
    self:newLine()
end

function Board.newLine(self)
    self:updateSqrCursor(false)

    self.currentLine = math.min(self.lines, self.currentLine + 1)
    self.cursor = 1

    self:updateSqrCursor(true)
end
