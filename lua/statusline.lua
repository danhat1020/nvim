vim.api.nvim_set_hl(0, "StatusLineNormal", { fg = "#b8b8b8" })
vim.api.nvim_set_hl(0, "StatusLineFileName", { fg = "#f0f0f0" })
vim.api.nvim_set_hl(0, "StatusLineFilePath", { fg = "#808080" })
local colors = { "#C06060", "#C0A060", "#60A0C0" }
for i, group in ipairs({ "Error", "Warn", "Info" }) do
	vim.api.nvim_set_hl(0, "StatusLine" .. group, { fg = colors[i], bold = true })
end

local stat_filename = function()
	local bufname = vim.api.nvim_buf_get_name(0)

	if vim.bo.filetype == "oil" then
		bufname = bufname:gsub("^oil://", "")
		bufname = bufname:gsub("/$", "")
		bufname = vim.fn.fnamemodify(bufname, ":~")
		return "%#StatusLineFilePath#" .. bufname .. "%*"
	end

	if bufname == "" then
		return "%#StatusLineNormal#[No Name]%*"
	end

	local full = vim.fn.fnamemodify(bufname, ":~")
	local dir = vim.fn.fnamemodify(full, ":h")
	local file = vim.fn.fnamemodify(full, ":t")

	return "%#StatusLineFilePath#" .. dir .. "/%#StatusLineFileName#" .. file .. "%*"
end

local stat_diagnostic = function()
	local counts = vim.diagnostic.count(0)
	if vim.tbl_isempty(counts) then
		return ""
	end

	local s = vim.diagnostic.severity
	local parts = {}

	if (counts[s.ERROR] or 0) > 0 then
		table.insert(parts, "  %#StatusLineError#E:" .. counts[s.ERROR] .. "%*")
	end
	if (counts[s.WARN] or 0) > 0 then
		table.insert(parts, "  %#StatusLineWarn#W:" .. counts[s.WARN] .. "%*")
	end
	if (counts[s.INFO] or 0) > 0 then
		table.insert(parts, "  %#StatusLineInfo#I:" .. counts[s.INFO] .. "%*")
	end

	return table.concat(parts)
end

_G.Statusline = function()
	return table.concat({
		"%#StatusLineNormal#",
		stat_filename(),
		" %m%h",
		"%=",
		stat_diagnostic(),
		"%#StatusLineNormal#    [%L lines]",
		"   %l,%c",
		"   %P",
	})
end

vim.opt.statusline = "%!v:lua.Statusline()"
