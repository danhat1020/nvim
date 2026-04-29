-- Name:        hubbamax
-- Description: Hubba hubba hubba.
-- Author:      Maxim Kim <habamax@gmail.com>
-- URL:         https://github.com/vim/colorschemes
-- License:     Same as Vim
-- Ported to Lua

vim.cmd("set background=dark")
vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "hubbamax"

-- Terminal colors
vim.g.terminal_ansi_colors = {
  "#1c1c1c", "#af5f5f", "#5faf5f", "#af875f",
  "#5f87af", "#af87af", "#5f8787", "#9e9e9e",
  "#767676", "#d75f87", "#87d787", "#d7af87",
  "#5fafd7", "#d787d7", "#87afaf", "#c7c7c7",
}
for i, color in ipairs(vim.g.terminal_ansi_colors) do
  vim.g["terminal_color_" .. (i - 1)] = color
end

local hi = vim.api.nvim_set_hl

-- Links
local links = {
  CurSearch             = "IncSearch",
  CursorLineFold        = "FoldColumn",
  CursorLineSign        = "FoldColumn",
  Float                 = "Number",
  Function              = "Identifier",
  LineNrAbove           = "LineNr",
  LineNrBelow           = "LineNr",
  MessageWindow         = "Pmenu",
  Number                = "Constant",
  PopupNotification     = "Todo",
  PopupSelected         = "PmenuSel",
  PreInsert             = "NonText",
  Quote                 = "String",
  StatusLineTerm        = "StatusLine",
  StatusLineTermNC      = "StatusLineNC",
  TabPanel              = "Normal",
  TabPanelFill          = "Normal",
  Terminal              = "Normal",
  asciidoctorBlock      = "Special",
  asciidoctorCode       = "String",
  asciidoctorH1Delimiter = "Statement",
  asciidoctorH2Delimiter = "Statement",
  asciidoctorH3Delimiter = "Statement",
  asciidoctorH4Delimiter = "Statement",
  asciidoctorH5Delimiter = "Statement",
  asciidoctorH6Delimiter = "Statement",
  asciidoctorListMarker = "Constant",
  asciidoctorMacro      = "Special",
  asciidoctorOption     = "Special",
  asciidoctorSetextHeaderDelimiter = "Statement",
  asciidoctorTitleDelimiter = "Statement",
  javaScriptFunction    = "Statement",
  javaScriptIdentifier  = "Statement",
  lspDiagSignErrorText  = "Removed",
  lspDiagSignHintText   = "Added",
  lspDiagSignInfoText   = "Question",
  lspDiagSignWarningText = "Changed",
  lspDiagVirtualTextError   = "Removed",
  lspDiagVirtualTextHint    = "Added",
  lspDiagVirtualTextInfo    = "Question",
  lspDiagVirtualTextWarning = "Changed",
  markdownUrl           = "String",
  rubyDefine            = "Statement",
  rubyMacro             = "Statement",
  sqlKeyword            = "Statement",
  sqlSpecial            = "Constant",
  vimCommentString      = "Comment",
  vimOper               = "Normal",
  vimParenSep           = "Normal",
  vimSep                = "Normal",
  vimVar                = "Normal",
  yamlBlockMappingKey   = "Statement",
}

for group, target in pairs(links) do
  hi(0, group, { link = target })
end

-- Base highlight groups
hi(0, "Normal",        { fg = "#c7c7c7", bg = "none" })
hi(0, "Added",         { fg = "#5fd75f" })
hi(0, "Changed",       { fg = "#ffaf5f" })
hi(0, "Character",     { fg = "#87d787" })
hi(0, "ColorColumn",   { bg = "#3a3a3a" })
hi(0, "Comment",       { fg = "#d8c0e0" })
hi(0, "Conceal",       { fg = "#585858" })
hi(0, "Constant",      { fg = "#d75f87" })
hi(0, "Cursor",        { fg = "#000000", bg = "#dadada" })
hi(0, "CursorColumn",  { bg = "#303030" })
hi(0, "CursorLine",    { bg = "#303030" })
hi(0, "CursorLineNr",  { fg = "#dadada", bold = true })
hi(0, "Debug",         { fg = "#5f8787" })
hi(0, "DiffAdd",       { bg = "#273923" })
hi(0, "DiffChange",    { bg = "#37352f" })
hi(0, "DiffDelete",    { fg = "#767676", bg = "#2f1f1a" })
hi(0, "DiffText",      { bg = "#0f4f4f" })
hi(0, "Directory",     { fg = "#87afaf", bold = true })
hi(0, "EndOfBuffer",   { fg = "#585858" })
hi(0, "Error",         { bg = "#a03f2f" })
hi(0, "ErrorMsg",      { fg = "#af5f5f", bg = "#1c1c1c", reverse = true })
hi(0, "FoldColumn",    { fg = "#585858" })
hi(0, "Folded",        { fg = "#9e9e9e", bg = "#262626" })
hi(0, "Identifier",    { fg = "#87afaf" })
hi(0, "Ignore",        {})
hi(0, "IncSearch",     { fg = "#101010", bg = "#c8a8a0" })
hi(0, "LineNr",        { fg = "#c0c0c0" })
hi(0, "LineNrAbove",   { fg = "#585858" })
hi(0, "LineNrBelow",   { fg = "#585858" })
hi(0, "MatchParen",    { fg = "#d070f0", bold = true })
hi(0, "ModeMsg",       { bold = true })
hi(0, "MoreMsg",       { fg = "#5faf5f" })
hi(0, "NonText",       { fg = "#585858" })
hi(0, "Pmenu",         { bg = "none" })
hi(0, "PmenuExtra",    { fg = "#404040", bg = "none" })
hi(0, "PmenuKind",     { fg = "#404040", bg = "none" })
hi(0, "PmenuMatch",    { fg = "#6080c0", bg = "none" })
hi(0, "PmenuExtraSel", { fg = "#989898", bg = "#404040" })
hi(0, "PmenuKindSel",  { fg = "#989898", bg = "#404040" })
hi(0, "PmenuMatchSel", { fg = "#6080c0", bg = "#404040" })
hi(0, "PmenuSbar",     {})
hi(0, "PmenuSel",      { bg = "#404040" })
hi(0, "PmenuThumb",    { bg = "#767676" })
hi(0, "PreProc",       { fg = "#af875f" })
hi(0, "Question",      { fg = "#d7af87" })
hi(0, "QuickFixLine",  { bg = "#4f2f4f" })
hi(0, "Removed",       { fg = "#d75f5f" })
hi(0, "Search",        { fg = "none",    bg = "#605030" })
hi(0, "SignColumn",    {})
hi(0, "Special",       { fg = "#5f8787" })
hi(0, "SpecialKey",    { fg = "#585858" })
hi(0, "SpellBad",      { fg = "#d75f5f", undercurl = true, sp = "#d75f5f" })
hi(0, "SpellCap",      { fg = "#ffaf5f", undercurl = true, sp = "#ffaf5f" })
hi(0, "SpellLocal",    { fg = "#5fd75f", undercurl = true, sp = "#5fd75f" })
hi(0, "SpellRare",     { fg = "#d787d7", undercurl = true, sp = "#d787d7" })
hi(0, "Statement",     { fg = "#af87af" })
hi(0, "StatusLine",    { fg = "#c0c0c0", bg = "#181818" })
hi(0, "StatusLineNC",  { fg = "#505050", bg = "#101010" })
hi(0, "String",        { fg = "#5faf5f" })
hi(0, "TabLine",       { fg = "#1c1c1c", bg = "#767676" })
hi(0, "TabLineFill",   { fg = "#1c1c1c", bg = "#767676" })
hi(0, "TabLineSel",    { fg = "#1c1c1c", bg = "#9e9e9e", bold = true })
hi(0, "Title",         { bold = true })
hi(0, "TitleBar",      { fg = "#dadada", bg = "#3c3c3c" })
hi(0, "TitleBarNC",    { fg = "#767676", bg = "#2c2c2c" })
hi(0, "Todo",          { fg = "#000000", bg = "#d8c0e0", bold = true })
hi(0, "ToolbarButton", { fg = "#767676", bg = "#1c1c1c", bold = true, reverse = true })
hi(0, "ToolbarLine",   {})
hi(0, "Type",          { fg = "#5f87af" })
hi(0, "Underlined",    { underline = true })
hi(0, "VertSplit",     { fg = "#767676", bg = "#767676" })
hi(0, "Visual",        { bg = "#202020" })
hi(0, "VisualNOS",     { fg = "#1c1c1c", bg = "#5f8787" })
hi(0, "WarningMsg",    { fg = "#d75f87" })
hi(0, "WildMenu",      { fg = "#1c1c1c", bg = "#d7af87", bold = true })
hi(0, "debugBreakpoint", { fg = "#1c1c1c", bg = "#d75f87" })
hi(0, "debugPC",       { fg = "#1c1c1c", bg = "#5f87af" })
hi(0, "lCursor",       { fg = "#1c1c1c", bg = "#5fff00" })
-- diagnostics
hi(0, "DiagnosticError", { fg = "#d04040" })
hi(0, "DiagnosticWarn",  { fg = "#d0bb40" })
hi(0, "DiagnosticHint",  { fg = "#4080d0" })
hi(0, "DiagnosticInfo",  { fg = "#90a0d0" })
hi(0, "DiagnosticUnderlineError", { underline = true, sp = "#d04040" })
hi(0, "DiagnosticUnderlineWarn",  { underline = true, sp = "#d0bb40" })
hi(0, "DiagnosticUnderlineHint",  { underline = true, sp = "#4080d0" })
hi(0, "DiagnosticUnderlineInfo",  { underline = true, sp = "#90a0d0" })
