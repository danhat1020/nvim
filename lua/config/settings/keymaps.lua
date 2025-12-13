-- keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, ":", ";", { noremap = true })
vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { silent = true, noremap = true }) -- yank to clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { silent = true, noremap = true }) -- paste from clipboard
vim.keymap.set("v", "p", '"_dP', { silent = true, noremap = true }) -- paste without overwriting register
vim.keymap.set({ "n", "v" }, "x", '"_x', { silent = true, noremap = true }) -- delete character without copying to register
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- center when jumping up half page
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- center when jumping down half page
vim.keymap.set("n", "G", "Gzz") -- center when jumping to bottom of file
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true }) -- move selected lines down
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true }) -- move selected lines up
vim.keymap.set("n", "<leader>mx", "<CMD>!chmod +x %<CR>", { silent = true, noremap = true }) -- making a file executable
vim.keymap.set("n", "<Space>", "<Nop>") -- unbind space in normal mode
vim.keymap.set("n", "<BS>", "<Nop>") -- unbind backspace in normal mode
vim.keymap.set("n", "<leader>so", ":update<CR>:source $MYVIMRC<CR>", { silent = false, noremap = true })
