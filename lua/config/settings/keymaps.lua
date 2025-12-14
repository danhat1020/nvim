vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- swap ; and :
vim.keymap.set({ "n", "v" }, ":", ";", { noremap = true })
vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })

-- yank and paste using system clipboard
vim.keymap.set({ "n", "v", "x" }, "<leader>y", '"+y', { silent = true, noremap = true })
vim.keymap.set({ "n", "v", "x" }, "<leader>p", '"+p', { silent = true, noremap = true })

-- paste without overwriting register
vim.keymap.set("v", "p", '"_dP', { silent = true, noremap = true })

-- delete character without copying to register
vim.keymap.set({ "n", "v" }, "x", '"_x', { silent = true, noremap = true })

-- center while navigating
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "G", "Gzz")

-- move selected lines up and down
vim.keymap.set("v", "<S-j>", ":m '>+1<CR>gv=gv", { silent = true, noremap = true })
vim.keymap.set("v", "<S-k>", ":m '<-2<CR>gv=gv", { silent = true, noremap = true })

-- make a file executable
vim.keymap.set("n", "<leader>mx", "<CMD>!chmod +x %<CR>", { silent = true, noremap = true })

-- unbind space and backspace when in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<BS>", "<Nop>")

-- source vimrc
vim.keymap.set("n", "<leader>so", ":update<CR>:source %<CR>", { silent = true, noremap = true })
