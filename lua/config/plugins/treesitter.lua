return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = false,
			indent = { enable = true },
			ensure_installed = {
				"python",
				"java",
				"javascript",
				"typescript",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"vim",
				"vimdoc",
				"rust",
				"c",
			},
			ignore_install = {},
			modules = {},
		})
	end,
}
