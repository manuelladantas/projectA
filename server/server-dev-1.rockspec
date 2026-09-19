package = "server"
version = "dev-1"
source = {
   url = "git+ssh://git@github.com/manuelladantas/projectA.git"
}
description = {
   homepage = "*** please enter a project homepage ***",
   license = "*** please specify a license ***"
}
dependencies = {
   "lua ~> 5.5",
   "lunajson ~> 1.2.3",
}
build = {
   type = "builtin",
   modules = {
      ["actions.room"] = "actions/room.lua",
      conf = "conf.lua",
      ["game.global"] = "game/global.lua",
      ["game.room"] = "game/room.lua",
      ["game.state"] = "game/state.lua",
      main = "main.lua",
      network = "network.lua",
      router = "router.lua"
   }
}
test_dependencies = {
   queries = {}
}
