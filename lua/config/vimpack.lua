local vimpack = function(directory)
	local files = vim.fn.glob("~/.config/nvim/lua/" .. directory .. "/*.lua", false, true)
	local plugins = {}
	for _, file in ipairs(files) do
		local spec = require(directory .. "/" .. vim.fn.fnamemodify(file, ":t:r"))
		local plug_name = spec[1]
		local repo = "https://github.com/" .. plug_name
		local branch = nil
		if spec.branch ~= nil then
			branch = spec.branch
			table.insert(plugins, { src = repo, version = branch })
		else
			table.insert(plugins, repo)
		end
	end
	vim.pack.add(plugins)
	for _, file in ipairs(files) do
		local spec = require(directory .. "/" .. vim.fn.fnamemodify(file, ":t:r"))
		spec.config()
	end
end

vimpack("plugins")
