local json = require "dkjson"

require("src.client.network")

function love.load()
    Client:startConnection()
end

function love.update(dt)
    Client.tick(dt)
    require("lurker").update()
end

function love.draw()
    love.graphics.print(json.encode({ hello = "World" }), 20, 20)
end
