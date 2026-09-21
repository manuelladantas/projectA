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
        {nil, nil,nil, nil, nil},
        {nil, nil,nil, nil, nil},
        {nil, nil,nil, nil, nil},
        {nil, nil,nil, nil, nil},
        {nil, nil,nil, nil, nil},
        {nil, nil,nil, nil, nil}
    },
    word = {},
    currentLine = 1
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
            local charSqr = CharSquare:new({positionX = positionX, positionY = positionY, width = 70, height = 70, plainChar = love.graphics.newText(font, "")})
            self.boardMatrix[i][j] = charSqr
        end
    end    
end

function Board.draw(self)
    -- print(self.text)
    for i=1, #self.boardMatrix, 1 do
        for j=1, #self.boardMatrix[i], 1 do
            charSqr = self.boardMatrix[i][j]
            charSqr:draw()
        end
    end
end

function Board.updateWord(self, char)
    local len = #self.word
   if  len < 5 then
     local cursor = len+1
     table.insert(self.word, cursor, char)
     local sqr = self.boardMatrix[self.currentLine][cursor]
     sqr:setText(char)
     print(table.concat(self.word, ", "))
   end
end

function Board.removeWord(self)
    local cursor = #self.word
    if cursor > 0 then
        table.remove(self.word, cursor)
        local sqr = self.boardMatrix[self.currentLine][cursor]
        sqr:cleanText()
        print(table.concat(self.word, ", "))
    end
end
