-- options
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 6
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
vim.o.winborder = "single"
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.undofile = true
vim.o.guicursor = ""
-- keymaps
vim.g.mapleader = " "
vim.keymap.set({ "i", "v", "x" }, "<C-c>", "<Esc>", { silent = true, noremap = true })   -- use ctrl+c as escape
vim.keymap.set({ "n", "v", "x" }, ";", ":")                                              -- remove need for shift when entering command mode
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { silent = true, noremap = true }) -- yank to system clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { silent = true, noremap = true }) -- paste from system clipboard
-- autocommands
vim.api.nvim_create_autocmd("TextYankPost", {                                            -- highlight on yank
    group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
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
    { src = "https://github.com/vague-theme/vague.nvim" },
    { src = "https://github.com/williamboman/mason.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter",          version = "master" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
})
-- colorscheme
require("vague").setup({
    transparent = true,
    italic = false,
    colors = { string = "#aba1b6", func = "#947ea1", number = "#c8aa95" },
})
vim.cmd.colorscheme("vague")
vim.cmd("hi StatusLine guibg=NONE")
-- lsp setup (ts_ls, html, cssls)
require("mason").setup({})
local servers = { "clangd", "bash-language-server", "marksman", "emmylua_ls" }
local all = vim.list_extend(vim.list_extend({}, servers), { "ast-grep", "beautysh", "prettierd", "stylua" })
for _, server in ipairs(all) do
    if not require("mason-registry").is_installed(server) then
        vim.cmd("MasonInstall " .. server)
    end
end
vim.lsp.enable(servers)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
    callback = function()
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, noremap = true })                -- Show documentation (hover)
        vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, { silent = true, noremap = true })      -- [L]SP [F]ormat
        vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { silent = true, noremap = true })      -- [L]SP [R]ename
        vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { silent = true, noremap = true }) -- [L]SP see available [C]ode actions
        vim.cmd("set completeopt+=noselect")
    end,
})
-- oil
require("oil").setup({ view_options = { show_hidden = true } })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { silent = true, noremap = true })
-- treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "c", "markdown", "bash" },
    highlight = { enable = true },
})
-- other
require("render-markdown").setup({ heading = { position = "inline" } })
