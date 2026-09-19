require("network")
require("router")
require("actions.room")

function love.load()
    io.stdout:setvbuf("no")
    Router.addCallback("joinRoom", RoomService.joinRoom)

    Server.start()
end

function love.update(dt)
    Server.tick(dt)
end
