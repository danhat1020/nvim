local fzf = require("fzf-lua")
fzf.setup({
	fzf_bin = "sk",
	winopts = {
		width = 0.8,
		height = 0.5,
		row = 0,
		col = 1,
		border = "single",
		title = "",
		title_pos = "center",
		preview = {
			default = "builtin",
			border = "single",
			winopts = { relativenumber = true },
		},
	},
	hls = {
		border = "Comment",
		title = "IncSearch",
		preview_border = "Comment",
		preview_title = "IncSearch",
	},
})
vim.keymap.set("n", "<leader>sf", fzf.files, { silent = true, noremap = true }) -- find files in cwd
vim.keymap.set("n", "<leader>ss", fzf.live_grep, { silent = true, noremap = true }) -- grep string in cwd
vim.keymap.set("n", "<leader>sh", fzf.helptags, { silent = true, noremap = true }) -- find in help docs
