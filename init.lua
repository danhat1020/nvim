-- NOTE: options
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 6
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
vim.o.winborder = "single"
vim.o.cursorline = true
vim.o.swapfile = false
vim.o.undofile = true
-- NOTE: keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- quality of life
vim.keymap.set({ "i", "v", "x", "c" }, "<C-c>", "<Esc>", { silent = true, noremap = true }) -- use ctrl+c as escape
vim.keymap.set("v", "p", '"_dP', { silent = true, noremap = true }) -- paste without overwriting register
vim.keymap.set({ "n", "v" }, "x", '"_x', { silent = true, noremap = true }) -- delete character without copying to register
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- center when jumping up half page
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- center wheh jumping down half page
vim.keymap.set("n", "G", "Gzz") -- center when jumping to end of buffer
-- extra functionality
vim.keymap.set({ "n", "v", "x" }, ";", ":") -- swap ; and :
vim.keymap.set({ "n", "v", "x" }, ":", ";") -- ^^
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { silent = true, noremap = true }) -- yank to system clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { silent = true, noremap = true }) -- paste from system clipboard
vim.keymap.set("n", "<leader>mx", "<CMD>!chmod +x %<CR>", { silent = true, noremap = true }) -- make file executable from within neovim
vim.keymap.set("n", "<leader>r", ":restart<CR>") -- restart neovim
-- unbinds
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>") -- unbind space in normal and visual mode
vim.keymap.set({ "n", "v" }, "<BS>", "<Nop>") -- unbind backspace in normal and visual mode
vim.keymap.set({ "n", "v", "x", "i", "c" }, "<C-q>", "<Nop>") -- unbind ctrl+q in all modes
-- plugin management
vim.keymap.set("n", "<leader>aps", 'ivim.pack.add({ "https://github.com/" })<Left><Left><Left><Left>') -- add plugin standalone
vim.keymap.set("n", "<leader>api", 'o"https://github.com/",<Left><Left>') -- add plugin inside
vim.keymap.set("n", "<leader>up", "<CMD>lua vim.pack.update()<CR>", { silent = true, noremap = true }) -- update plugins
vim.keymap.set("n", "<leader>dp", '$T/yt":lua vim.pack.del({ "<C-r>"" })<CR><S-v>"_d') -- delete plugin on current line
-- NOTE: autocommands
vim.api.nvim_create_autocmd("TextYankPost", { -- highlight on yank
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
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
-- NOTE: plugins
vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/vague-theme/vague.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/folke/todo-comments.nvim",
})
-- NOTE: colorscheme
require("vague").setup({
	transparent = true,
	bold = false,
	italic = false,
	colors = {
		line = "#0a0a0a",
		search = "#c0c2c8",
		comment = "#606060",
		string = "#a89ab2",
		func = "#9e85a4",
		number = "#c7a391",
	},
})
vim.cmd.colorscheme("vague")
vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#c8c8c8" })
-- NOTE: lsp setup
local servers = {
	clangd = {},
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
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "love" } },
			workspace = {
				library = { vim.env.VIMRUNTIME, vim.fn.stdpath("data") .. "/lua/love-types" },
				checkThirdParty = false,
			},
			completion = { callSnippet = "Replace" },
		},
	},
})
vim.lsp.enable("lua_ls")
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	"stylua",
	"prettierd",
	"prettier",
	"beautysh",
	"ast_grep",
	"ruff",
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	automatic_installation = false,
})
-- setup lsp keymaps
local fzf_lua = require("fzf-lua")
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(ev)
		local opts = { silent = true, noremap = true }
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation (hover)
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts) -- [L]SP [F]ormat file
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- [L]SP [R]ename
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts) -- [L]SP see available code [A]ctions
		vim.keymap.set("n", "<leader>lc", vim.diagnostic.open_float, opts) -- [L]SP show diagnostics for [C]urrent line
		vim.keymap.set("n", "<leader>ld", fzf_lua.diagnostics_document, opts) -- [L]SP show document [D]iagnostics
	end,
})
-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local mode = vim.api.nvim_get_mode().mode
		local filetype = vim.bo.filetype
		if vim.bo.modified == true and mode == "n" and filetype ~= "oil" then
			vim.lsp.buf.format()
		end
	end,
})
local fg_col = "#f0f0f0"
local bg_col = "#202020"
local border_col = "#808080"
vim.api.nvim_set_hl(0, "FzfTitleBarHl", { fg = fg_col, bg = bg_col, bold = true })
vim.api.nvim_set_hl(0, "FzfBorderHl", { fg = border_col, bg = "NONE" })
local fzf = require("fzf-lua")
-- NOTE: fzf lua
fzf.setup({
	fzf_bin = "sk",
	winopts = {
		border = "single",
		title_flags = false,
		preview = { default = "builtin", border = "single", winopts = { relativenumber = true } },
	},
	hls = {
		border = "FzfBorderHl",
		title = "FzfTitleBarHl",
		preview_border = "FzfBorderHl",
		preview_title = "FzfTitleBarHl",
	},
	files = { cwd_prompt = false, color_icons = false },
	grep = { color_icons = false },
})
vim.keymap.set("n", "<leader>sf", fzf.files, { silent = true, noremap = true }) -- find files in cwd
vim.keymap.set("n", "<leader>ss", fzf.live_grep, { silent = true, noremap = true }) -- grep string in cwd
vim.keymap.set("n", "<leader>sh", fzf.helptags, { silent = true, noremap = true }) -- find in help docs
-- NOTE: oil
require("oil").setup({
	columns = {},
	skip_confirm_for_simple_edits = true,
	prompt_save_on_select_new_entry = false,
	constrain_cursor = "name",
	watch_for_changes = true,
	keymaps = { ["q"] = { "actions.close", mode = "n" }, ["<leader>cd"] = { "actions.cd", mode = "n" } },
	view_options = { show_hidden = true },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { silent = true, noremap = true })
-- NOTE: treesitter
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
-- NOTE: other plugins
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
require("todo-comments").setup({})
-- NOTE: statusline
local M = {}
local function set_hl()
	vim.api.nvim_set_hl(0, "SLFileName", { fg = "#e0e0e0", bg = "NONE", bold = true })
	vim.api.nvim_set_hl(0, "SLFilePath", { link = "EndOfBuffer" })
	vim.api.nvim_set_hl(0, "SLOffWhite", { fg = "#e0e0e0", bg = "NONE" })
end
set_hl()
function M.filename()
	local file = vim.fn.expand("%:p")
	if file == "" then
		return ""
	end
	local home = vim.loop.os_homedir()
	---@diagnostic disable-next-line: param-type-mismatch
	file = file:gsub("^" .. vim.pesc(home), "~")
	local path = vim.fn.fnamemodify(file, ":h")
	local name = vim.fn.fnamemodify(file, ":t")
	name = name .. " %#SLOffWhite#%m"
	if vim.bo.filetype == "oil" then
		---@diagnostic disable-next-line: param-type-mismatch
		local oil_path = path:gsub("^oil://" .. vim.pesc(home), "~")
		return table.concat({ "%#SLFilePath#", oil_path, "/" })
	end
	if path == "." then
		return "%#SLFileName#" .. name
	end
	return table.concat({ "%#SLFilePath#", path, "/", "%#SLFileName#", name })
end

function M.diagnostics()
	local bufnr = 0
	local counts = {
		errors = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR }),
		warns = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN }),
		hints = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT }),
	}
	local parts = {}
	if counts.errors > 0 then
		table.insert(parts, "%#DiagnosticError#!!-" .. counts.errors)
	end
	if counts.warns > 0 then
		table.insert(parts, "%#DiagnosticWarn#!-" .. counts.warns)
	end
	if counts.hints > 0 then
		table.insert(parts, "%#DiagnosticHint#?-" .. counts.hints)
	end
	if #parts == 0 then
		return ""
	end
	return "  %#SLFilePath#|  " .. table.concat(parts, "  ")
end

function M.lsp()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end
	local names = {}
	for _, client in ipairs(clients) do
		table.insert(names, client.name)
	end
	return "%#SLOffWhite# " .. table.concat(names, ", ") .. "%#SLFilePath#  |"
end

function M.cursor()
	return "%#SLOffWhite#%l:%c"
end

_G.Line = M
vim.o.statusline = table.concat({
	"%{%v:lua.Line.filename()%}",
	"%{%v:lua.Line.diagnostics()%}",
	"%=",
	"%{%v:lua.Line.lsp()%}",
	"  ",
	"%{%v:lua.Line.cursor()%}",
	" ",
})
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_hl })
vim.cmd("hi StatusLine guibg=NONE")
