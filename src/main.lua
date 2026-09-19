local json = require "dkjson"

require("src.hud.hud")
require("src.client.network")

function love.load()
    SetupHud()
    Client.startConnection()
end

function love.update(dt)
    Client.tick(dt)
end

function love.draw()
    love.graphics.rectangle("fill", 100, 100, 200, 200, 16, 15)
end
