local json = require "dkjson"

function love.draw()
    love.graphics.print(json.encode({ hello = "World" }), 20, 20)
end
