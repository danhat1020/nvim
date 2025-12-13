return {
	"Saghen/blink.cmp",
	version = "1.*",
	opts = {
		keymap = {
			["<C-e>"] = { "show_and_insert", "fallback" }, --    CTRL+E (show completion menu)
			["<Tab>"] = { "accept", "fallback" }, --                TAB (accept currently selected)
			["<C-n>"] = { "select_next", "fallback" }, --        CTRL+N (next option)
			["<C-p>"] = { "select_prev", "fallback" }, --        CTRL+P (previous option)
			["<C-k>"] = { "show_documentation", "fallback" }, -- CTRL+K (show documentation)
			["<Esc>"] = { "hide", "fallback" }, --                ESC (cancel completion)
		},
		appearance = { nerd_font_variant = "normal" },
		fuzzy = { implementation = "prefer_rust" },
		completion = {
			trigger = {
				show_in_snippet = false,
				show_on_backspace_after_accept = false,
				show_on_backspace_after_insert_enter = false,
				show_on_keyword = false,
				show_on_trigger_character = false,
				show_on_accept_on_trigger_character = false,
				show_on_insert_on_trigger_character = false,
			},
		},
	},
}
