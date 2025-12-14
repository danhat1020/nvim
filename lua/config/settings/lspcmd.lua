-- setup lsp keymaps
local fzf_lua = require("fzf-lua")
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
	callback = function(ev)
		vim.diagnostic.config({ virtual_text = true })
		local options = { buffer = ev.buf, silent = true }
		vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, options) -- LSP format file
		vim.keymap.set({ "n", "x" }, "<leader>lc", vim.lsp.buf.code_action, options) -- See available code actions
		vim.keymap.set("n", "<leader>ld", fzf_lua.diagnostics_document, options) -- Show document diagnostics
		vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, options) -- Smart rename
		vim.keymap.set("n", "K", vim.lsp.buf.hover, options) -- Show documentation (hover)
		vim.keymap.set("n", "<leader>lD", vim.lsp.buf.definition, options) -- Go to LSP definition
		vim.keymap.set("n", "<leader>lR", fzf_lua.lsp_references, options) -- Show LSP references
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
