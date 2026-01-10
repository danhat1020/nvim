vim.pack.add({
	-- lsp
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	-- fzf-lua
	"https://github.com/ibhagwan/fzf-lua",
	-- oil
	"https://github.com/stevearc/oil.nvim",
	-- colorschemes
	"https://github.com/vague-theme/vague.nvim",
	-- treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	-- render markdown
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})
require("plugins.color")
require("plugins.lsp")
require("plugins.fzf")
require("plugins.oil")
require("plugins.treesitter")
require("plugins.markdown")
