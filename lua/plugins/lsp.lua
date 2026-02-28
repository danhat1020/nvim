return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup()

		local servers = { "clangd", "marksman", "emmylua_ls" }
		local all = vim.list_extend(servers, { "ast-grep", "prettierd", "stylua" })
		for _, package in ipairs(all) do
			if not require("mason-registry").is_installed(package) then
				vim.cmd("MasonInstall " .. package)
			end
			vim.lsp.config(package, {})
		end

		vim.lsp.enable(servers)
		vim.diagnostic.config({ virtual_text = true })

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { silent = true, noremap = true })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { silent = true, noremap = true })
				vim.keymap.set("n", "gra", require("fzf-lua").lsp_code_actions, { silent = true, noremap = true })
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = args.buf,
					callback = function()
						vim.lsp.buf.format({ async = false, id = args.data.client_id })
					end,
				})
			end,
		})
	end,
}
