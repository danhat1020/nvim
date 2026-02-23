-- install plugins
vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = "v1.8.0" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/stevearc/dressing.nvim" },
})

-- autocomplete
require("blink-cmp").setup({
	completion = {
		list = {
			selection = { auto_insert = false },
		},
		menu = { auto_show = false },
	},
	keymap = {
		["<C-e>"] = { "show", "cancel", "fallback" },
		["<CR>"] = { "accept", "fallback" },
	},
})

-- file explorer
require("oil").setup({
	columns = {},
	win_options = { signcolumn = "yes" },
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = true,
	constrain_cursor = "name",
	watch_for_changes = true,
	view_options = { show_hidden = true },
})
vim.keymap.set("n", "-", ":Oil<CR>", { silent = true })

-- fuzzy picker
require("fzf-lua").setup({
	winopts = {
		height = 0.9,
		width = 0.6,
		row = 0.5,
		col = 0.5,
		border = "single",
		backdrop = 100,
		preview = {
			border = "single",
			winopts = {
				relative_number = true,
				cursorline = false,
			},
		},
	},
	fzf_opts = { ["--color"] = "bw" },
})
vim.keymap.set("n", "<leader>sf", ":FzfLua files<CR>", { silent = true })
vim.keymap.set("n", "<leader>sb", ":FzfLua buffers<CR>", { silent = true })
vim.keymap.set("n", "<leader>sh", ":FzfLua helptags<CR>", { silent = true })
vim.keymap.set("n", "<leader>ss", ":FzfLua live_grep<CR>", { silent = true })

-- colorscheme
require("vague").setup({
	bold = true,
	colors = {
		bg = "none",
		inactiveBg = "none",
		func = "#8088a0",
		string = "#b098c8",
		number = "#80a0b0",
		comment = "#585858",
		visual = "#282828",
	},
})
vim.cmd.colorscheme("vague")

-- additional highlighting
vim.api.nvim_set_hl(0, "IncSearch", { fg = "#121212", bg = "#d0b8a0" })
vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#d0d0d0", bold = true })
local colors = { "#C06060", "#C0A060", "#60A0C0", "#A0B0C0" }
for i, group in ipairs({ "Error", "Warn", "Info", "Hint" }) do
	vim.api.nvim_set_hl(0, "Diagnostic" .. group, { fg = colors[i] })
	vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. group, { underline = true, sp = colors[i] })
	vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. group, { fg = colors[i], bold = true })
end
