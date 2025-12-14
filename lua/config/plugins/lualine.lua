return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			text = "#e0e0e0",
			bg = "#181818",
			normal = "#404040",
			insert = "#46334D",
			visual = "#33334D",
			command = "#4D3339",
			replace = "#4D4633",
		}

		local my_theme = {
			normal = {
				a = { fg = colors.text, bg = colors.normal, gui = "bold" },
				b = { fg = colors.text, bg = colors.bg },
				c = { fg = colors.text },
			},
			insert = {
				a = { fg = colors.text, bg = colors.insert, gui = "bold" },
				b = { fg = colors.text, bg = colors.bg },
				c = { fg = colors.text },
			},
			visual = {
				a = { fg = colors.text, bg = colors.visual, gui = "bold" },
				b = { fg = colors.text, bg = colors.bg },
				c = { fg = colors.text },
			},
			command = {
				a = { fg = colors.text, bg = colors.command, gui = "bold" },
				b = { fg = colors.text, bg = colors.bg },
				c = { fg = colors.text },
			},
			replace = {
				a = { fg = colors.text, bg = colors.replace, gui = "bold" },
				b = { fg = colors.text, bg = colors.bg },
				c = { fg = colors.text },
			},
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = my_theme,
				section_separators = {},
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{
						"lsp_status",
						icons_enabled = false,
						symbols = { separator = "  " },
					},
				},
				lualine_c = { "diagnostics" },
				lualine_x = {
					{
						"diff",
						colored = true,
						symbols = { added = "+", modified = "*", removed = "-" },
					},
					{
						"branch",
						icon = {
							"\u{e0a0}",
							color = { fg = colors.text },
						},
					},
				},
				lualine_y = {
					{
						"filename",
						path = 0,
						symbols = { modified = "[+]", readonly = "", unnamed = "", newfile = "[New]" },
					},
					{
						"filetype",
						colored = true,
						icon = { align = "left" },
					},
				},
				lualine_z = { "progress", "location" },
			},
		})
		vim.cmd("hi StatusLine guibg=NONE")
	end,
}
