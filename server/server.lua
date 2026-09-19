require("network")
require("router")
require("actions.room")

function love.load()
    io.stdout:setvbuf("no")
    Router.addCallback("joinRoom", JoinRoom)

    Server.start()
end

function love.update(dt)
    Server.tick(dt)
end
