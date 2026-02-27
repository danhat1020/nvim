vim.g.mapleader = " "

-- use ctrl+c as escape
vim.keymap.set({ "i", "v", "x" }, "<C-c>", "<Esc>")

-- <leader>y/p to yank/paste using system clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p')

-- x deletes to void register
vim.keymap.set({ "n", "v", "x" }, "x", '"_x')

-- add/remove surrounding characters
for _, pairs in ipairs({ "()", "[]", "{}", "''", '""', "<>" }) do
	vim.keymap.set("v", "<leader>s" .. pairs:sub(1, 1), "c" .. pairs .. "P")
	vim.keymap.set("n", "<leader>r" .. pairs:sub(1, 1), "di" .. pairs:sub(1, 1) .. 'vh"_xP')
end

-- remove unused plugins
local plugin_remove = function()
	local unused_plugins = {}
	local all_plugins = vim.pack.get()

	for _, plugin in ipairs(all_plugins) do
		if not plugin.active then
			local name = plugin.spec.name
			table.insert(unused_plugins, name)
		end
	end

	if #unused_plugins > 0 then
		local names = table.concat(
			vim.tbl_map(function(p)
				return "  > " .. p
			end, unused_plugins),
			"\n"
		)

		vim.pack.del(unused_plugins)
		vim.notify("vim.pack: Deleted " .. #unused_plugins .. " unused plugin(s):\n" .. names, vim.log.levels.WARN)
	elseif #unused_plugins == 0 then
		vim.notify("vim.pack: No plugins to remove.", vim.log.levels.WARN)
	end
end

vim.keymap.set("n", "<leader>dp", plugin_remove)
vim.keymap.set("n", "<leader>up", vim.pack.update)
