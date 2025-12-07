-- options
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.undofile = true
vim.o.winborder = "single"
vim.o.showmode = false
vim.o.cursorline = true
vim.o.guicursor = ""
-- keymaps
vim.g.mapleader = " "
vim.keymap.set({ "i", "v", "c", "x" }, "<C-c>", "<Esc>", { silent = true, noremap = true }) -- send esc instead of ctrl+c
vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })
vim.keymap.set({ "n", "v" }, ":", ";", { noremap = true })
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { silent = true, noremap = true }) -- yank to clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { silent = true, noremap = true }) -- paste from clipboard
vim.keymap.set("v", "p", '"_dP', { silent = true, noremap = true }) -- paste without overwriting register
vim.keymap.set({ "n", "v" }, "x", '"_x', { silent = true, noremap = true }) -- delete character without copying to register
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- center when jumping up half page
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- center when jumping down half page
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true }) -- move selected lines down
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true }) -- move selected lines up
vim.keymap.set("n", "<leader>mx", "<CMD>!chmod +x %<CR>", { silent = true, noremap = true }) -- making a file executable
vim.keymap.set("n", "<Space>", "<Nop>") -- unbind space in normal mode
vim.keymap.set("n", "<BS>", "<Nop>") -- unbind backspace in normal mode
-- autocmds
vim.api.nvim_create_autocmd("TextYankPost", { -- highlight on yank
	group = vim.api.nvim_create_augroup("HighlightYank", {}),
	pattern = "*",
	callback = function()
		vim.hl.on_yank()
	end,
})
vim.api.nvim_create_autocmd("BufReadPost", { -- restore cursor to previous position
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})
vim.api.nvim_create_autocmd("FileType", { -- remove auto commenting
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})
-- plugins
vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/vague-theme/vague.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/stevearc/dressing.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.7.0" },
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})
-- colortheme
require("vague").setup({
	transparent = true,
	style = {
		boolean = "none",
		comments = "none",
		headings = "none",
		strings = "none",
		keyword_return = "none",
		builtin_types = "none",
	},
	colors = { line = "#0C0C0C" },
})
vim.cmd.colorscheme("vague")
-- treesitter
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
-- lualine
local colors = { text = "#e0e0e0", hl = "#202020", bg = "#141414" }
local my_theme = {
	normal = {
		a = { fg = colors.text, bg = colors.hl, gui = "bold" },
		b = { fg = colors.text, bg = colors.bg },
		c = { fg = colors.text },
		z = { fg = colors.text, bg = colors.hl },
	},
	insert = {
		a = { fg = colors.text, bg = colors.hl, gui = "bold" },
		b = { fg = colors.text, bg = colors.bg },
		c = { fg = colors.text },
		z = { fg = colors.text, bg = colors.hl },
	},
	visual = {
		a = { fg = colors.text, bg = colors.hl, gui = "bold" },
		b = { fg = colors.text, bg = colors.bg },
		c = { fg = colors.text },
		z = { fg = colors.text, bg = colors.hl },
	},
	command = {
		a = { fg = colors.text, bg = colors.hl, gui = "bold" },
		b = { fg = colors.text, bg = colors.bg },
		c = { fg = colors.text },
		z = { fg = colors.text, bg = colors.hl },
	},
	replace = {
		a = { fg = colors.text, bg = colors.hl, gui = "bold" },
		b = { fg = colors.text, bg = colors.bg },
		c = { fg = colors.text },
		z = { fg = colors.text, bg = colors.hl },
	},
}
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = my_theme,
		section_separators = { left = "\u{e0b8}", right = "\u{e0ba}" },
		component_separators = { left = "::", right = "::" },
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { { "lsp_status", icons_enabled = false, symbols = { separator = " :: " } } },
		lualine_c = { "diagnostics" },
		lualine_x = {
			{
				"diff",
				colored = true,
				symbols = { added = "+", modified = "*", removed = "-" },
			},
			{ "branch", icon = { "\u{e0a0}", color = { fg = colors.text } } },
		},
		lualine_y = {
			{ "filename", path = 0, symbols = { modified = "[+]", readonly = "", unnamed = "", newfile = "[New]" } },
			{ "filetype", colored = true, icon = { align = "left" } },
		},
		lualine_z = { "progress", "location" },
	},
})
vim.cmd("hi StatusLine guibg=NONE")
-- dressing
require("dressing").setup({})
-- oil
_G.oil_winbar_dir = function()
	local dir = require("oil").get_current_dir()
	dir = dir:gsub("/home/slick", "~")
	return "    " .. (dir or "")
end
require("oil").setup({
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = false,
	constrain_cursor = "name",
	keymaps = { ["<Esc>"] = { "actions.close", mode = "n" }, ["<leader>cd"] = { "actions.cd", mode = "n" } },
	view_options = { show_hidden = true },
	win_options = {
		winbar = "%{v:lua.oil_winbar_dir()}",
	},
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { silent = true, noremap = true })
-- fzf lua
require("fzf-lua").setup({
	winopts = { height = 1.0, width = 1.0, row = 0.5, col = 0.5, backdrop = 0, title = "Fzf-lua", title_pos = "left" },
})
-- fzf lua keymaps
local fzf_lua = require("fzf-lua")
vim.keymap.set("n", "<leader>sf", fzf_lua.files, { silent = true, noremap = true }) -- find files in cwd
vim.keymap.set("n", "<leader>ss", fzf_lua.live_grep, { silent = true, noremap = true }) -- grep string in cwd
vim.keymap.set("n", "<leader>sh", fzf_lua.helptags, { silent = true, noremap = true }) -- find in help docs
vim.keymap.set("n", "<leader>sw", fzf_lua.grep_cword, { silent = true, noremap = true }) -- grep word under cursor
vim.keymap.set("n", "<leader>sW", fzf_lua.grep_cWORD, { silent = true, noremap = true }) -- grep WORD under cursor
vim.keymap.set("n", "<leader>sb", fzf_lua.buffers, { silent = true, noremap = true }) -- find existing buffers
vim.keymap.set("n", "<leader>/", fzf_lua.lgrep_curbuf, { silent = true, noremap = true }) -- grep string in current buffer
-- lspconfig
local servers = {
	clangd = {},
	rust_analyzer = {},
	lua_ls = {},
	ts_ls = {},
	html = {},
	cssls = {},
	glsl_analyzer = {},
	bashls = {},
	marksman = {},
	basedpyright = { settings = { basedpyright = { analysis = { typeCheckingMode = "basic" } } } },
}
for server, config in pairs(servers) do
	vim.lsp.config(server, config)
	vim.lsp.enable(server)
end
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	"stylua",
	"prettierd",
	"prettier",
	"beautysh",
	"ast_grep",
	"rustfmt",
	"ruff",
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
-- mason
require("mason").setup({})
require("mason-lspconfig").setup({ ensure_installed = {}, automatic_installation = false })
-- lsp settings
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(ev)
		local options = { buffer = ev.buf, silent = true }
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, options) -- LSP format file
		vim.keymap.set({ "n", "x" }, "<leader>lc", vim.lsp.buf.code_action, options) -- See available code actions
		vim.keymap.set("n", "<leader>ld", fzf_lua.diagnostics_document, options) -- Show document diagnostics
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, options) -- Smart rename
		vim.keymap.set("n", "K", vim.lsp.buf.hover, options) -- Show documentation (hover)
		vim.keymap.set("n", "<leader>lD", vim.lsp.buf.definition, options) -- Go to LSP definition
		vim.keymap.set("n", "<leader>lR", fzf_lua.lsp_references, options) -- Show LSP references
	end,
})
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local mode = vim.api.nvim_get_mode().mode
		local filetype = vim.bo.filetype
		if vim.bo.modified == true and mode == "n" and filetype ~= "oil" then
			vim.lsp.buf.format()
		else
		end
	end,
})
-- blink
require("blink-cmp").setup({
	keymap = {
		["<C-e>"] = { "show_and_insert", "fallback" }, --    CTRL+E (show completion menu)
		["<C-y>"] = { "accept", "fallback" }, --             CTRL+Y (accept currently selected)
		["<C-n>"] = { "select_next", "fallback" }, --        CTRL+N (next option)
		["<C-p>"] = { "select_prev", "fallback" }, --        CTRL+P (previous option)
		["<C-s>"] = { "show_documentation", "fallback" }, -- CTRL+S (show documentation)
		["<Esc>"] = { "cancel", "fallback" }, --                ESC (cancel completion)
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
})
-- render-markdown
require("render-markdown").setup({
	checkbox = {
		bullet = true,
		unchecked = { icon = "󰄱 " },
		checked = { icon = "󰱒 " },
		custom = { todo = { rendered = "󰄗 " } },
		scope_priority = nil,
	},
	heading = { position = "inline" },
})
