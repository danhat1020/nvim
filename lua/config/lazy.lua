-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "config.plugins" },
		{ import = "config.plugins.lsp" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
})

require("config.settings.lspcmd")

local col_picker = require("colorscheme-picker")

col_picker.setup({
	picker = "fzf-lua",
	include_stock = false,
	colors = {
		transparent = true,
		cursor_line = "#0c0c0c",
		line_number_current = "#e0e0e0",
		line_number = "#202020",
	},
	style = {
		bold = false,
		italic = false,
		underline = true,
	},
	keymaps = {
		pick = "<leader>sc",
		print = "<leader>pc",
	},
})
