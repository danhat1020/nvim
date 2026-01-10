local M = {}
local function set_hl()
	-- transparent base
	vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
	vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
	-- filename
	vim.api.nvim_set_hl(0, "SLFileName", { fg = "#e0e0e0", bg = "NONE", bold = true })
	vim.api.nvim_set_hl(0, "SLFilePath", { link = "EndOfBuffer" })
	-- lsp + cursor
	vim.api.nvim_set_hl(0, "SLOffWhite", { fg = "#e0e0e0", bg = "NONE" })
	-- diagnostics
	vim.api.nvim_set_hl(0, "SLDiagError", { fg = "#e06060", bg = "NONE", bold = true })
	vim.api.nvim_set_hl(0, "SLDiagWarn", { fg = "#e0c060", bg = "NONE" })
	vim.api.nvim_set_hl(0, "SLDiagHint", { fg = "#8098e0", bg = "NONE" })
end
set_hl()
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_hl,
})
function M.filename()
	local file = vim.fn.expand("%:p")
	if file == "" then
		return ""
	end
	local home = vim.loop.os_homedir()
	---@diagnostic disable-next-line: param-type-mismatch
	file = file:gsub("^" .. vim.pesc(home), "~")
	local path = vim.fn.fnamemodify(file, ":h")
	local name = vim.fn.fnamemodify(file, ":t")
	name = name .. " %#SLOffWhite#%m"
	if vim.bo.filetype == "oil" then
		---@diagnostic disable-next-line: param-type-mismatch
		local oil_path = path:gsub("^oil://" .. vim.pesc(home), "~")
		return table.concat({ "%#SLFilePath#", oil_path, "/" })
	end
	if path == "." then
		return "%#SLFileName#" .. name
	end
	return table.concat({ "%#SLFilePath#", path, "/", "%#SLFileName#", name })
end

function M.diagnostics()
	local bufnr = 0
	local counts = {
		errors = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR }),
		warns = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN }),
		hints = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT }),
	}
	local parts = {}
	if counts.errors > 0 then
		table.insert(parts, "%#SLDiagError#!!-" .. counts.errors)
	end
	if counts.warns > 0 then
		table.insert(parts, "%#SLDiagWarn#!-" .. counts.warns)
	end
	if counts.hints > 0 then
		table.insert(parts, "%#SLDiagHint#?-" .. counts.hints)
	end
	if #parts == 0 then
		return ""
	end
	return "  %#SLFilePath#|  " .. table.concat(parts, "  ")
end

function M.lsp()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end
	local names = {}
	for _, client in ipairs(clients) do
		table.insert(names, client.name)
	end
	return "%#SLOffWhite# " .. table.concat(names, ", ") .. "%#SLFilePath#  |"
end

function M.cursor()
	return "%#SLOffWhite#%l:%c"
end

_G.Line = M
vim.o.statusline = table.concat({
	"%{%v:lua.Line.filename()%}",
	"%{%v:lua.Line.diagnostics()%}",
	"%=",
	"%{%v:lua.Line.lsp()%}",
	"  ",
	"%{%v:lua.Line.cursor()%}",
	" ",
})
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = set_hl,
})
