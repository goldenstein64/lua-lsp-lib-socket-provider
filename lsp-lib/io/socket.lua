local socket = require("socket")

---@class lsp*.io.provider.socket : lsp*.io.provider
local ioSocket = {
	---@type socket.tcp.client
	connection = nil,
}

---@param port integer
function ioSocket:open(port)
	local connection = assert(socket.connect("127.0.0.1", port))
	---@cast connection socket.tcp.client

	self.connection = connection
end

function ioSocket:close()
	if self.connection then
		self.connection:close()
		self.connection = nil
	end
end

---@param bytes integer
---@return string data
function ioSocket:read(bytes)
	return assert(self.connection:receive(bytes))
end

---@param data string
function ioSocket:write(data)
	self.connection:send(data)
end

return ioSocket
