return {
	{
		"dgox16/oldworld.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("oldworld").setup({
				integrations = {
					lsp = true,
					markdown = true,
					treesitter = true,
				},
			})
		end,
	},
	{
		"vague-theme/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({
				bold = false,
				italic = false,
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nightfox").setup({})
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_foreground = "material"
			vim.g.gruvbox_material_disable_italic_comment = 1
			vim.g.gruvbox_material_enable_bold = 0
			vim.g.gruvbox_material_enable_italic = 0
			vim.g.gruvbox_material_diagnostic_line_highlight = 1
		end,
	},
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.o.background = "dark"
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				transparent = {
					float = true,
				},
			})
		end,
	},
}
