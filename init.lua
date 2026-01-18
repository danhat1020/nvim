vim.pack.add({
    { src = 'https://github.com/nvim-lua/plenary.nvim' },                                 -- plenary
    { src = 'https://github.com/ThePrimeagen/harpoon',            version = 'harpoon2' }, -- harpoon
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' },   -- better code highlighting
    { src = 'https://github.com/stevearc/oil.nvim' },                                     -- file explorer
    { src = 'https://github.com/vague-theme/vague.nvim' },                                -- colorscheme
    { src = 'https://github.com/williamboman/mason.nvim' },                               -- LSP plugin manager
})
-- configure plugins
local harpoon = require('harpoon')
harpoon:setup()
require('nvim-treesitter.configs').setup({ ensure_installed = { 'lua', 'c', 'markdown', 'bash' }, highlight = { enable = true } })
require('oil').setup({ columns = {}, view_options = { show_hidden = true } })
require('vague').setup({ colors = { string = '#c0a8da', func = '#9f83ac', number = '#6e94b2', inactiveBg = '#0a0a0a', bg = 'NONE' } })
-- configure lsp
require('mason').setup()
local servers = { 'clangd', 'bash-language-server', 'marksman', 'emmylua_ls' }
local all = vim.list_extend(vim.list_extend({}, servers), { 'ast-grep', 'beautysh', 'prettierd', 'stylua' }) -- formatters
for _, server in ipairs(all) do                                                                              -- for each server
    if not require('mason-registry').is_installed(server) then                                               -- if not installed
        vim.cmd("MasonInstall " .. server)                                                                   -- install
    end
end
vim.lsp.enable(servers)
-- set options
vim.o.number = true                                                                  -- line numbers
vim.o.relativenumber = true                                                          -- line numbers based on distance to current line
vim.o.tabstop = 4                                                                    -- tab width 4
vim.o.shiftwidth = 4                                                                 -- tab width 4
vim.o.expandtab = true                                                               -- turn tabs into spaces
vim.o.smartindent = true                                                             -- keeps or changes indent based on code context
vim.o.wrap = false                                                                   -- turns wrapping off
vim.o.swapfile = false                                                               -- swapfile is annoying
vim.o.undofile = true                                                                -- allows persistent undo across restarts
vim.o.ignorecase = true                                                              -- ignore case when searching...
vim.o.smartcase = true                                                               -- ...unless uppercase letter is used
vim.o.hlsearch = false                                                               -- do not highlight all search matches
vim.o.winborder = 'single'                                                           -- add single border around windows
vim.o.signcolumn = 'yes'                                                             -- add column on left
vim.o.guicursor = ""                                                                 -- cursor always block
vim.o.updatetime = 50                                                                -- fast update time
vim.o.autoread = true                                                                -- watch for changes outside of neovim
vim.opt.path:append('**')                                                            -- include subdirectories in search
vim.cmd.colorscheme("vague")                                                         -- set colorscheme
vim.api.nvim_set_hl(0, 'IncSearch', { fg = '#100f11', bg = '#af97c8', bold = true }) -- change highlighting of search and yank
-- set keymaps
vim.g.mapleader = " "
vim.keymap.set('i', '<C-c>', '<Esc>')                                                    -- ctrl-c as escape
vim.keymap.set({ 'n', 'v', 'x' }, ';', ':')                                              -- no shift for command mode
vim.keymap.set({ 'n', 'v', 'x' }, ':', ';')                                              -- shift for find next
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y', { silent = true, noremap = true }) -- yank to system clipboard
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p', { silent = true, noremap = true }) -- paste from system clipboard
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true, noremap = true })               -- center when jumping up
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true, noremap = true })               -- center when jumping down
vim.keymap.set('n', 'G', 'Gzz', { silent = true, noremap = true })                       -- center when jumping to bottom
vim.keymap.set('v', '<S-j>', 'ojoj')                                                     -- move selection down
vim.keymap.set('v', '<S-k>', 'okok')                                                     -- move selection up
-- plugin keymaps
vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)                    ------> harpoon: add file
vim.keymap.set('n', '<BS>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) ------> harpoon: toggle menu
vim.keymap.set('n', '<M-q>', function() harpoon:list():select(1) end)                    ------> harpoon: select file 1
vim.keymap.set('n', '<M-w>', function() harpoon:list():select(2) end)                    ------> harpoon: select file 2
vim.keymap.set('n', '<M-e>', function() harpoon:list():select(3) end)                    ------> harpoon: select file 3
vim.keymap.set('n', '<M-r>', function() harpoon:list():select(4) end)                    ------> harpoon: select file 4
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { silent = true, noremap = true })              ------> oil: open file explorer
-- auto commands
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true, noremap = true })                -- show documentation
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, { silent = true, noremap = true })  -- go to definition
        vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { silent = true, noremap = true }) -- code actions
        vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { silent = true, noremap = true })      -- lsp format buffer
        vim.cmd('set completeopt+=noselect')                                                          -- don't select autocomplete
        vim.api.nvim_create_autocmd('BufWritePre', {                                                  -- format on save
            buffer = args.buf,
            callback = function() vim.lsp.buf.format({ async = false, id = args.data.client_id }) end,
        })
    end
})
vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank({ timeout = 200 }) end })
vim.cmd('autocmd FileType * set formatoptions-=ro')
