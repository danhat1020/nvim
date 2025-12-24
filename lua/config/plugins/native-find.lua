return {
	"danhat1020/native-find.nvim",
	lazy = false,
	config = function()
		local native = require("native-find")
		native.setup({
			height = 0.6,
			width = 0.8,
		})
		-- vim.keymap.set("n", "<leader>sf", native.find_files)
		-- vim.keymap.set("n", "<leader>sb", native.find_buffers)
		-- vim.keymap.set("n", "<leader>ss", native.live_grep)
		-- vim.keymap.set("n", "<leader>sh", native.find_help)
		-- vim.keymap.set("n", "<leader>sw", native.grep_word_under_cursor)
		-- vim.keymap.set("n", "<leader>sW", native.grep_WORD_under_cursor)
	end,
}
