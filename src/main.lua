require("src.hud.hud")
require("src.hud.board")
require("src.client.network")

local board = Board:new({
    text = "defora",
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
})

function love.load()
    Hud.load()
    board:mount()
    Client.startConnection()
end

function love.textinput(t)
    board:updateWord(t)
end

function love.keypressed(key)
    print("Press: ", key)
    if key == "backspace" then
       board:removeWord()
    end
end

function love.update(dt)
    Client.tick(dt)
end

function love.draw()
    board:draw()
end
