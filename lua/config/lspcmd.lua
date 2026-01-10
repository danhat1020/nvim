-- setup lsp keymaps
local fzf_lua = require("fzf-lua")
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(ev)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- Show documentation (hover)
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts) -- [L]SP [F]ormat file
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts) -- [L]SP [R]ename
		vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts) -- [L]SP see available code [A]ctions
		vim.keymap.set("n", "<leader>lc", vim.diagnostic.open_float, opts) -- [L]SP show diagnostics for [C]urrent line
		vim.keymap.set("n", "<leader>ld", fzf_lua.diagnostics_document, opts) -- [L]SP show document [D]iagnostics
	end,
})
-- format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local mode = vim.api.nvim_get_mode().mode
		local filetype = vim.bo.filetype
		if vim.bo.modified == true and mode == "n" and filetype ~= "oil" then
			vim.lsp.buf.format()
		end
	end,
})
