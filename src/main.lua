local json = require "dkjson"

require("src.hud.hud")
require("src.hud.board")
require("src.client.network")

function love.load()
    Hud.setupHud()
    Client.startConnection()
end

function love.update(dt)
    Client.tick(dt)
end

function love.draw()
    Board.draw()
end
