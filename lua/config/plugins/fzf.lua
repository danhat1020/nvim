return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzf_lua = require("fzf-lua")
		fzf_lua.setup({
			winopts = {
				height = 0.8,
				width = 0.8,
				row = 0.5,
				col = 0.5,
				border = "single",
				backdrop = 0,
				title = "Fzf-lua",
				title_pos = "center",
				preview = {
					default = "bat",
					border = "single",
					winopts = {
						relativenumber = true,
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>sf", fzf_lua.files, { silent = true, noremap = true }) -- find files in cwd
		vim.keymap.set("n", "<leader>ss", fzf_lua.live_grep, { silent = true, noremap = true }) -- grep string in cwd
		vim.keymap.set("n", "<leader>sh", fzf_lua.helptags, { silent = true, noremap = true }) -- find in help docs
		vim.keymap.set("n", "<leader>sw", fzf_lua.grep_cword, { silent = true, noremap = true }) -- grep word under cursor
		vim.keymap.set("n", "<leader>sW", fzf_lua.grep_cWORD, { silent = true, noremap = true }) -- grep WORD under cursor
		vim.keymap.set("n", "<leader>sb", fzf_lua.buffers, { silent = true, noremap = true }) -- find existing buffers
		vim.keymap.set("n", "<leader>/", fzf_lua.lgrep_curbuf, { silent = true, noremap = true }) -- grep string in current buffer
	end,
}
