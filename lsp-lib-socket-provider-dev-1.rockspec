package = "lsp-lib-socket-provider"
version = "dev-1"
rockspec_format = "3.0"
source = {
   url = "git://github.com/goldenstein64/lua-lsp-lib-socket-provider.git"
}
description = {
   homepage = "https://github.com/goldenstein64/lua-lsp-lib-socket-provider",
   license = "MIT",
}
dependencies = {
   "lua >= 5.1",
   "luasocket ~> 3.1",
}
build = {
   type = "builtin",
   modules = {
      ["lsp-lib.io.socket"] = "lsp-lib/io/socket.lua"
   },
}
