vim.cmd("autocmd TextYankPost * lua vim.highlight.on_yank({ timeout = 120 })")
vim.cmd("autocmd FileType * set formatoptions-=ro")
