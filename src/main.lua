require("src.hud.hud")
require("src.hud.board")
require("src.client.network")

local board = Board:new()

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
    if key == "left" then
        board:moveCursor("back")
    end
    if key == "right" then
        board:moveCursor("next")
    end
    if key == "return" then
        board:submitLine()
    end
end

function love.update(dt)
    Client.tick(dt)
    require("lurker").update()
end

function love.draw()
    board:draw()
end
