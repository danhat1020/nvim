local M = {}

local term = { buf = nil, win = nil, fullscreen = false }

-- ==== HELPERS ====
local function win_is_open(win) return win ~= nil and vim.api.nvim_win_is_valid(win) end
local function buf_is_valid(buf) return buf ~= nil and vim.api.nvim_buf_is_valid(buf) end
local function half_height() return math.floor(vim.o.lines / 2) end

-- ==== OPEN/CLOSE ====
local function open_terminal()
  vim.cmd('botright ' .. half_height() .. 'split')
  local new_win = vim.api.nvim_get_current_win()

  if buf_is_valid(term.buf) then vim.api.nvim_win_set_buf(new_win, term.buf)
  else
    vim.cmd('terminal')
    term.buf = vim.api.nvim_get_current_buf()
    pcall(vim.api.nvim_buf_set_name, term.buf, 'term://horizontal')
  end

  term.win        = new_win
  term.fullscreen = false

  vim.wo[new_win].number         = false
  vim.wo[new_win].relativenumber = false
  vim.wo[new_win].signcolumn     = 'no'

  vim.cmd('startinsert')
end

local function close_terminal()
  vim.api.nvim_win_hide(term.win)
  term.win        = nil
  term.fullscreen = false
end

-- Toggle the terminal split open / closed
function M.toggle()
  if win_is_open(term.win) then close_terminal()
  else open_terminal() end
end

-- Toggle between half-screen and fullscreen for the terminal window
function M.toggle_fullscreen()
  if not win_is_open(term.win) then return end
  if term.fullscreen then
    vim.api.nvim_win_set_height(term.win, half_height())
    term.fullscreen = false
  else
    vim.api.nvim_win_set_height(term.win, vim.o.lines)
    term.fullscreen = true
  end
end

local function setup_keymaps()
  vim.keymap.set({ 'n', 't' }, '<C-t>', M.toggle, { noremap = true, silent = true })
  vim.keymap.set({ 'n', 't' }, '<C-f>', M.toggle_fullscreen, { noremap = true, silent = true })

  vim.keymap.set({ 'n', 't' }, '<C-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
  vim.keymap.set({ 'n', 't' }, '<C-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
  vim.keymap.set({ 'n', 't' }, '<C-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
  vim.keymap.set({ 'n', 't' }, '<C-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })
end

setup_keymaps()

return M
