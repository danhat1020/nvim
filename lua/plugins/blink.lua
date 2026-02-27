return {
	"saghen/blink.cmp",
	branch = "v1.8.0",

	config = function()
		require("blink-cmp").setup({
			completion = {
				list = { selection = { auto_insert = false } },
				menu = { auto_show = false },
			},
			keymap = {
				["<C-e>"] = { "show", "cancel", "fallback" },
				["<CR>"] = { "accept", "fallback" },
			},
		})
	end,
}
