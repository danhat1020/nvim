vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' }, -- better code highlighting
    { src = 'https://github.com/nvim-mini/mini.pick' },                                 -- fuzzy finder
    { src = 'https://github.com/stevearc/oil.nvim' },                                   -- file explorer
    { src = 'https://github.com/vague-theme/vague.nvim' },                              -- colorscheme
    { src = 'https://github.com/williamboman/mason.nvim' },                             -- LSP plugin manager
})
-- configure plugins
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'c', 'markdown', 'bash' },
    highlight = { enable = true },
})
require('mini.pick').setup({
    window = { prompt_caret = '|', prompt_prefix = '$ ' },
})
require('oil').setup({
    columns = {},
    view_options = { show_hidden = true },
})
require('vague').setup({
    bold = false,
    colors = { string = '#c0a8da', func = '#9f83ac', number = '#6e94b2', inactiveBg = '#0d0d0d', bg = 'NONE' },
})
-- configure lsp
require('mason').setup({})
local servers = { 'clangd', 'bash-language-server', 'marksman', 'emmylua_ls' }
local all = vim.list_extend(vim.list_extend({}, servers), { 'ast-grep', 'beautysh', 'prettierd', 'stylua' }) -- formatters
for _, server in ipairs(all) do                                                                              -- for each server
    if not require('mason-registry').is_installed(server) then                                               -- if not installed
        vim.cmd("MasonInstall " .. server)                                                                   -- install
    end
end
vim.lsp.enable(servers)
-- set options
vim.o.number = true          -- line numbers
vim.o.relativenumber = true  -- line numbers based on distance to current line
vim.o.tabstop = 4            -- tab width 4
vim.o.shiftwidth = 4         -- tab width 4
vim.o.expandtab = true       -- turn tabs into spaces
vim.o.smartindent = true     -- keeps or changes indent based on code context
vim.o.wrap = false           -- turns wrapping off
vim.o.swapfile = false       -- swapfile is annoying
vim.o.undofile = true        -- allows persistent undo across restarts
vim.o.ignorecase = true      -- ignore case when searching...
vim.o.smartcase = true       -- ...unless uppercase letter is used
vim.o.hlsearch = false       -- do not highlight all search matches
vim.o.winborder = 'single'   -- add single border around windows
vim.o.signcolumn = 'yes'     -- adds column on left for consistency
vim.cmd.colorscheme("vague") -- set colorscheme
-- set keymaps
vim.g.mapleader = " "
vim.keymap.set({ 'n', 'v', 'x' }, ';', ':')                                                     -- no shift for command mode
vim.keymap.set({ 'n', 'v', 'x' }, ':', ';')                                                     -- shift for find next
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>y', '"+y', { silent = true, noremap = true })        -- yank to system clipboard
vim.keymap.set({ 'n', 'v', 'x' }, '<leader>p', '"+p', { silent = true, noremap = true })        -- paste from system clipboard
vim.keymap.set('n', '<leader>o', '<CMD>e #<CR>', { silent = true, noremap = true })             -- switch to previous buffer
vim.keymap.set('v', '<S-k>', 'okok')                                                            -- move selection up
vim.keymap.set('v', '<S-j>', 'jojo')                                                            -- move selection down
-- set plugin keymaps
vim.keymap.set('n', '<leader>sf', '<CMD>Pick files<CR>', { silent = true, noremap = true })     -- search files in cwd
vim.keymap.set('n', '<leader>sh', '<CMD>Pick help<CR>', { silent = true, noremap = true })      -- search helptags
vim.keymap.set('n', '<leader>ss', '<CMD>Pick grep_live<CR>', { silent = true, noremap = true }) -- search string
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { silent = true, noremap = true })                     -- open file explorer
-- set lsp keymaps
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
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
    end,
})
-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
    callback = function() vim.highlight.on_yank({ timeout = 200 }) end,
})
