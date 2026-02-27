return {
	"ibhagwan/fzf-lua",
	config = function()
		require("fzf-lua").setup({
			winopts = {
				height = 0.8,
				width = 0.8,
				row = 0.5,
				col = 0.5,
				backdrop = 100,
				preview = {
					winopts = {
						relative_number = true,
						cursorline = false,
					},
				},
			},
			fzf_opts = { ["--color"] = "bw" },
		})
		require("fzf-lua").register_ui_select()
		vim.keymap.set("n", "<leader>sf", ":FzfLua files<CR>", { silent = true })
		vim.keymap.set("n", "<leader>sb", ":FzfLua buffers<CR>", { silent = true })
		vim.keymap.set("n", "<leader>sh", ":FzfLua helptags<CR>", { silent = true })
		vim.keymap.set("n", "<leader>ss", ":FzfLua live_grep<CR>", { silent = true })
	end,
}
