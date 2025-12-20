return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local colors = {
			text = "#e0e0e0",
			bg = "#181818",
			normal = "#282828",
			insert = "#46334D",
			visual = "#33334D",
			command = "#4D3339",
			replace = "#4D4633",
			t = "none",
		}

		local my_theme = {
			normal = {
				a = { fg = colors.text, bg = colors.normal, gui = "bold" },
				b = { fg = colors.text, bg = colors.bg },
				c = { fg = colors.text, bg = colors.t },
			},
			insert = {
				a = { fg = colors.text, bg = colors.insert, gui = "bold" },
				b = { fg = colors.text, bg = colors.bg },
				c = { fg = colors.text, bg = colors.t },
			},
			visual = {
				a = { fg = colors.text, bg = colors.visual, gui = "bold" },
				b = { fg = colors.text, bg = colors.bg },
				c = { fg = colors.text, bg = colors.t },
			},
			command = {
				a = { fg = colors.text, bg = colors.command, gui = "bold" },
				b = { fg = colors.text, bg = colors.bg },
				c = { fg = colors.text, bg = colors.t },
			},
			replace = {
				a = { fg = colors.text, bg = colors.replace, gui = "bold" },
				b = { fg = colors.text, bg = colors.bg },
				c = { fg = colors.text, bg = colors.t },
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
						"filename",
						path = 0,
						symbols = {
							modified = "[+]",
							readonly = "",
							unnamed = "",
							newfile = "[New]",
						},
					},
				},
				lualine_c = { "diagnostics" },
				lualine_x = {
					{
						"lsp_status",
						icons_enabled = false,
						symbols = { separator = "  " },
					},
				},
				lualine_y = {
					{
						"filetype",
						colored = true,
						icon = { align = "left" },
					},
				},
				lualine_z = { "progress", "location" },
			},
		})
	end,
}
