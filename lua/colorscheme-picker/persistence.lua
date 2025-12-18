local M = {}

local file = vim.fn.stdpath("data") .. "/colorscheme-picker.json"

function M.load()
	local fd = io.open(file, "r")
	if not fd then
		return nil
	end

	local content = fd:read("*a")
	fd:close()

	local ok, decoded = pcall(vim.json.decode, content)
	if not ok then
		return nil
	end

	return decoded.scheme
end

function M.save(name)
	if not name or name == "" then
		return
	end

	local fd = io.open(file, "w")
	if not fd then
		return
	end

	fd:write(vim.json.encode({ scheme = name }))
	fd:close()
end

return M
