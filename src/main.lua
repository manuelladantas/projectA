local json = require "dkjson"

require("src.hud.hud")
require("src.hud.board")
require("src.client.network")

function love.load()
    Hud.setupHud()
    Board.mount()
    Client.startConnection()
end

-- TODO: Mover isso para o main e chamar as instancias
function love.textinput(t)
    Board.updateWord(t)
end

-- TODO: Mesmo aqui
function love.keypressed(key)
    print("Press: ", key)
    if key == "backspace" then
       Board.removeWord()
    end
end

function love.update(dt)
    Client.tick(dt)
end

function love.draw()
    Board.draw()
end
