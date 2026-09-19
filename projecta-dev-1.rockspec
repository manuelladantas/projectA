package = "projectA"
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
   "dkjson ~> 2.11",
}
build = {
   type = "builtin",
   modules = {
      main = "src/main.lua"
   }
}
