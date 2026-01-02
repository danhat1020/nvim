require("render-markdown").setup({
	checkbox = {
		bullet = true,
		unchecked = { icon = "󰄱 " },
		checked = { icon = "󰱒 " },
		custom = {
			todo = { rendered = "󰄗 " },
		},
		scope_priority = nil,
	},
	heading = {
		position = "inline",
	},
})
