Board = {
    lines = 6,
    columns = 5,
    startX = 50,
    startY = 50,
    gapX = 10,
    gapY = 10,
    size = 70
}

function Board.draw()
    for i=1,Board.lines, 1 do
        for j = 1, Board.columns, 1 do
            local positionX = j * (Board.size + Board.gapX) + Board.startX
            local positionY = i * (Board.size + Board.gapY) + Board.startY

            love.graphics.rectangle("line", positionX, positionY, Board.size, Board.size, 16, 15)
        end
    end   
end