require("network")

function love.load()
    io.stdout:setvbuf("no")
    Server.start()
end

function love.update(dt)
    Server.tick(dt)
end
