LUA_VERSION = "5.5"

love.filesystem.setRequirePath(table.concat({
    love.filesystem.getRequirePath(),
    table.concat({ ";lua_modules/share/lua/", LUA_VERSION, "/?.lua" }),
    table.concat({ ";lua_modules/share/lua/", LUA_VERSION, "/?/init.lua" }),
    ";src/?.lua",
}))

love.filesystem.setCRequirePath(table.concat({
    love.filesystem.getCRequirePath(),
    table.concat({ ";lua_modules/lib/lua/", LUA_VERSION, "/??" }),
    ";lib/??",
}))

require("server")
