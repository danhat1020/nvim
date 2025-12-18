local M = {}

function M.get_user_schemes()
	local vimruntime = vim.env.VIMRUNTIME
	local schemes = {}

	for _, name in ipairs(vim.fn.getcompletion("", "color")) do
		local files = vim.api.nvim_get_runtime_file("colors/" .. name .. ".*", false)

		local path = files[1]

		if not vim.startswith(path, vimruntime) then
			table.insert(schemes, name)
		end
	end

	return schemes
end

function M.get_all_schemes()
	local schemes = {}

	for _, name in ipairs(vim.fn.getcompletion("", "color")) do
		table.insert(schemes, name)
	end

	return schemes
end

return M
