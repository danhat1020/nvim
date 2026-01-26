vim.pack.add({ 'https://github.com/nvim-mini/mini.pick' })
vim.pack.add({ 'https://github.com/stevearc/oil.nvim' })
vim.pack.add({ 'https://github.com/vague-theme/vague.nvim' })
vim.pack.add({ 'https://github.com/williamboman/mason.nvim' })
vim.pack.add({ { src = 'https://github.com/saghen/blink.cmp', version = 'v1.8.0' } })
-- clean plugins
local unused = {}
for _, plugin in ipairs(vim.pack.get()) do if not plugin.active then table.insert(unused, plugin.spec.name) end end
if #unused ~= 0 then vim.pack.del(unused) end
-- configure plugins
require('mini.pick').setup()
require('oil').setup({ columns = {}, view_options = { show_hidden = true } })
require('vague').setup({ colors = { bg = 'none', inactiveBg = 'none', func = '#9080a0', string = '#b8abd0', number = '#9ea4b2' } })
require('blink-cmp').setup({
    completion = { list = { selection = { preselect = false, auto_insert = false } }, menu = { auto_show = false } },
    fuzzy = { implementation = 'prefer_rust' },
    keymap = { ['<C-e>'] = { 'show', 'cancel', 'fallback' }, ['<CR>'] = { 'select_and_accept', 'fallback' } }
})
-- configure lsp
require('mason').setup()
local servers = { 'clangd', 'marksman', 'emmylua_ls' }
for _, package in ipairs(vim.list_extend(vim.list_extend({}, servers), { 'ast-grep', 'prettierd', 'stylua' })) do
    if not require('mason-registry').is_installed(package) then vim.cmd('MasonInstall ' .. package) end
end
vim.lsp.enable(servers)
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
vim.opt.path:append('**')
vim.cmd('colorscheme vague')
vim.api.nvim_set_hl(0, 'IncSearch', { fg = '#141414', bg = '#d8c0a8', bold = true })
local opts = { undercurl = false, underline = true }
for _, hl in ipairs(vim.fn.getcompletion('DiagnosticUnderline', 'highlight')) do vim.api.nvim_set_hl(0, hl, opts) end
-- set keymaps
vim.g.mapleader = ' '
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set({ 'n', 'v', 'x' }, ';', ':')
vim.keymap.set({ 'n', 'v', 'x' }, ':', ';')
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p', { silent = true, noremap = true })
vim.keymap.set({ 'n', 'v', 'x' }, 'x', '"_x')
for _, pair in ipairs({ '()', '[]', '{}', '""', "''", '**' }) do
    vim.keymap.set('v', '<leader>s' .. pair:sub(1, 1), 'c' .. pair .. '<Esc>P')
    vim.keymap.set('n', '<leader>r' .. pair:sub(1, 1), 'vi' .. pair:sub(1, 1) .. 'dvh"_xP')
end
-- plugin keymaps
vim.keymap.set('n', '<leader>f', ':Pick files<CR>', { silent = true })
vim.keymap.set('n', '<leader>h', ':Pick help<CR>', { silent = true })
vim.keymap.set('n', '<leader>b', ':Pick buffers<CR>', { silent = true })
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { silent = true, noremap = true })
-- auto commands
local function LspMaps(args)
    vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { silent = true, noremap = true })
    vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { silent = true, noremap = true })
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { silent = true, noremap = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = args.buf, callback = function() vim.lsp.buf.format({ async = false, id = args.data.client_id }) end })
end
vim.api.nvim_create_autocmd('LspAttach', { callback = LspMaps })
vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank({ timeout = 180 }) end })
vim.cmd('autocmd FileType * set formatoptions-=ro')
