return {
	"danhat1020/colorscheme-picker.nvim",
	dependencies = {
		"danhat1020/native-find.nvim",
	},
	config = function()
		require("colorscheme-picker").setup({
			picker = "fzf-lua",
			include_stock = false,
			colors = {
				transparent = true,
				cursor_line = "#101010",
				line_number_current = "#b0b0b0",
				line_number = "#404040",
				comment = "#505050",
				inc_search = "#698dc4",
				end_of_buffer = "#606060",
				visual_mode = "#2b2830",
			},
			style = {
				italic = false,
				undercurl = false,
			},
			keymaps = {
				pick = "<leader>cs",
				print = "<leader>cp",
			},
		})
	end,
}
