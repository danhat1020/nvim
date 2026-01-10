local fg_col = "#f0f0f0"
local bg_col = "#202020"
local border_col = "#808080"
vim.api.nvim_set_hl(0, "FzfTitleBarHl", { fg = fg_col, bg = bg_col, bold = true })
vim.api.nvim_set_hl(0, "FzfBorderHl", { fg = border_col, bg = "NONE" })

local fzf = require("fzf-lua")
fzf.setup({
	fzf_bin = "sk",
	winopts = {
		width = 0.8,
		height = 0.8,
		row = 0.5,
		col = 0.5,
		border = "single",
		title = "",
		title_pos = "center",
		title_flags = false,
		preview = {
			default = "builtin",
			border = "single",
			winopts = { relativenumber = true },
		},
	},
	hls = {
		border = "FzfBorderHl",
		title = "FzfTitleBarHl",
		preview_border = "FzfBorderHl",
		preview_title = "FzfTitleBarHl",
	},
	files = { cwd_prompt = false, color_icons = false },
	grep = { color_icons = false },
})
vim.keymap.set("n", "<leader>sf", fzf.files, { silent = true, noremap = true }) -- find files in cwd
vim.keymap.set("n", "<leader>ss", fzf.live_grep, { silent = true, noremap = true }) -- grep string in cwd
vim.keymap.set("n", "<leader>sh", fzf.helptags, { silent = true, noremap = true }) -- find in help docs
