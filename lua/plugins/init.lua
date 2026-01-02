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
	"https://github.com/mellow-theme/mellow.nvim",
	"https://github.com/slugbyte/lackluster.nvim",
	-- color picker
	"https://github.com/danhat1020/colorscheme-picker.nvim",
	-- treesitter
	"https://github.com/nvim-treesitter/nvim-treesitter",
	-- render markdown
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})

require("plugins.lsp")
require("plugins.fzf")
require("plugins.oil")
require("plugins.color-picker")
require("plugins.treesitter")
require("plugins.markdown")
