# lua-lsp-lib-socket-provider

A socket transport provider for the [`lsp-lib`](https://github.com/goldenstein64/lua-lsp-lib) module wrapped over [LuaSocket](https://github.com/lunarmodules/luasocket). See the linked `lsp-lib` repository for context.

## Usage

```sh
# Note: this module has not been uploaded yet!
$ luarocks --dev install lsp-lib-socket-provider
```

And in your server's main file,

```lua
local io_lsp = require("lsp-lib.io")
local provider = require("lsp-lib.io.socket")
local lsp = require("lsp-lib")

-- get the port used for the socket, e.g.
local port = arg[1] == "--socket" and tonumber(arg[2])
assert(port, "port not found")

-- It's recommended to use something like `argparse` or `alt-getopt` over
-- manual parsing.

-- this should be called once
-- IP is hard-coded to `127.0.0.1`
provider:open(port)

io_lsp.provider = provider

-- ...

lsp.listen()

-- the connection is closed when garbage collected
```

This module is provided as a simple way to support socket transport, but it may be more convenient to wrap the program's I/O using another program like [`ncat`](https://nmap.org/ncat/) or [`netcat`](https://netcat.sourceforge.net/).
