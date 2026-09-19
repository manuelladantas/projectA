require("src.hud.charSquare")

local font = love.graphics.getFont()
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

function Board.mount()
    for i = 1, Board.lines, 1 do
        for j = 1, Board.columns, 1 do
            local positionX = j * (Board.size + Board.gapX) + Board.startX
            local positionY = i * (Board.size + Board.gapY) + Board.startY
            local charSqr = CharSquare:new({positionX = positionX, positionY = positionY, width = 70, height = 70, plainChar = love.graphics.newText(font, "")})
            Board.boardMatrix[i][j] = charSqr
        end
    end    
end

function Board.draw()
    for i=1, #Board.boardMatrix, 1 do
        for j=1, #Board.boardMatrix[i], 1 do
            charSqr = Board.boardMatrix[i][j]
            charSqr:draw()
        end
    end
end

function Board.updateWord(char)
    local len = #Board.word
   if  len < 5 then
     local cursor = len+1
     table.insert(Board.word, cursor, char)
     local sqr = Board.boardMatrix[Board.currentLine][cursor]
     sqr:setText(char)
     print(table.concat(Board.word, ", "))
   end
end

function Board.removeWord()
     table.remove(Board.word, #Board.word)
    print(table.concat(Board.word, ", "))
end
