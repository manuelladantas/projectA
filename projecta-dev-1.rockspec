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
   queries = {
      {
         constraints = {
            {
               op = "~>",
               version = {
                  5, 5, string = "5.5"
               }
            }
         },
         name = "lua"
      }
   }
}
build_dependencies = {
   queries = {}
}
build = {
   type = "builtin",
   modules = {
      main = "main.lua"
   }
}
test_dependencies = {
   queries = {}
}
