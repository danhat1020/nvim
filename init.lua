vim.pack.add({ { src = 'https://github.com/saghen/blink.cmp', version = 'v1.8.0' } })
vim.pack.add({ 'https://github.com/stevearc/dressing.nvim' })
vim.pack.add({ 'https://github.com/vague-theme/vague.nvim' })
vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })
vim.pack.add({ 'https://github.com/williamboman/mason.nvim' })
for _, plugin in ipairs(vim.pack.get()) do if not plugin.active then vim.pack.del({ plugin.spec.name }) end end
-- plugins
require('blink-cmp').setup({
    completion = { menu = { auto_show = false }, list = { selection = { preselect = false, auto_insert = false } } },
    keymap = { ['<C-e>'] = { 'show', 'cancel', 'fallback' }, ['<CR>'] = { 'select_and_accept', 'fallback' } },
})
require('vague').setup({ colors = { bg = 'none', inactiveBg = 'none', func = '#9080a0', string = '#b0a0c0', number = '#8290d4' } })
require('oil').setup({ view_options = { show_hidden = true } })
-- lsp
require('mason').setup()
local servers = { 'clangd', 'marksman', 'emmylua_ls' }
for _, package in ipairs(vim.list_extend(vim.list_extend({}, servers), { 'ast-grep', 'prettierd', 'stylua' })) do
    if not require('mason-registry').is_installed(package) then vim.cmd('MasonInstall ' .. package) end
end
vim.lsp.enable(servers)
vim.diagnostic.config({ virtual_text = true })
-- set options
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.winborder = 'single'
vim.o.signcolumn = 'yes'
vim.o.guicursor = ''
vim.o.updatetime = 50
vim.cmd('colorscheme vague')
_G.FilePath = function() return vim.fn.expand('%:p'):gsub('^oil://', ''):gsub('^' .. vim.fn.expand('~'), '~') end
vim.o.statusline = "%{%v:lua.FilePath()%} %m %= %{%v:lua.vim.diagnostic.status()%}   %l,%c   %p%%   %L lines"
vim.api.nvim_set_hl(0, 'IncSearch', { fg = '#101010', bg = '#c8b4a8' })
-- set keymaps
vim.g.mapleader = ' '
vim.keymap.set({ 'i', 'v', 'x' }, '<C-c>', '<Esc>')
vim.keymap.set({ 'n', 'v', 'x' }, ':', ';', { noremap = true })
vim.keymap.set({ 'n', 'v', 'x' }, ';', ':', { noremap = true })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p', { silent = true, noremap = true })
vim.keymap.set('n', '-', ':Oil<CR>', { silent = true })
-- set autocommands
local function LspMaps(args)
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { silent = true, noremap = true })
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { silent = true, noremap = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf, callback = function() vim.lsp.buf.format({ async = false, id = args.data.client_id }) end })
end
vim.api.nvim_create_autocmd('LspAttach', { callback = LspMaps })
vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank({ timeout = 180 }) end })
vim.cmd('autocmd FileType * set formatoptions-=ro') -- remove auto comment
