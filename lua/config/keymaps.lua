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
