require("colorscheme-picker").setup({
	picker = "fzf-lua",
	include_stock = false,
	colors = {
		transparent = true,
		cursor_line = "#0a0a0a",
		line_number_current = "#b0b0b0",
		line_number = "#404040",
		comment = "#505050",
		mode_in_cmdbar = "#c0c0c0",
		end_of_buffer = "#606060",
		visual_mode = "#2b2830",
		highlight_search = "#deb890",
	},
	style = {
		bold = true,
		italic = false,
		undercurl = false,
	},
	keymaps = {
		pick = "<leader>cs",
		print = "<leader>cp",
	},
})
