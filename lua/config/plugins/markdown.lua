return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	opts = {
		checkbox = {
			bullet = true,
			unchecked = { icon = "󰄱 " },
			checked = { icon = "󰱒 " },
			custom = { todo = { rendered = "󰄗 " } },
			scope_priority = nil,
		},
		heading = { position = "inline" },
	},
}
