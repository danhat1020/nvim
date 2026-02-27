-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- tabbing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indents
vim.opt.autoindent = true
vim.opt.smartindent = true

-- turn off wrap
vim.opt.wrap = false

-- undos and swapfile options
vim.opt.swapfile = false
vim.opt.undofile = true

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.path:append("**")

-- visual options
vim.opt.winborder = "rounded"
vim.opt.signcolumn = "yes"
vim.opt.guicursor = ""
vim.opt.cursorline = true

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true
