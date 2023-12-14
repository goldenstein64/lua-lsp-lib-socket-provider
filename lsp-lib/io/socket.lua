local socket = require("socket")

---@class lsp*.io.provider.socket : lsp*.io.provider
local io_socket = {
	line_ending = "\r\n",

	---@type socket.tcp.client
	connection = nil,
}

---@param port integer
function io_socket:open(port)
	local connection = assert(socket.connect("127.0.0.1", port))
	---@cast connection socket.tcp.client

	self.connection = connection
end

function io_socket:close()
	if self.connection then
		self.connection:close()
		self.connection = nil
	end
end

---@param bytes integer
---@return string data
function io_socket:read(bytes)
	return (assert(self.connection:receive(bytes)))
end

---@param data string
function io_socket:write(data)
	self.connection:send(data)
end

return io_socket
