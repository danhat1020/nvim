return {
    { "neovim/nvim-lspconfig" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "williamboman/mason.nvim" },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local servers = {
                clangd = {},
                ts_ls = {},
                html = {},
                cssls = {},
                glsl_analyzer = {},
                bashls = {},
                marksman = {},
                basedpyright = { settings = { basedpyright = { analysis = { typeCheckingMode = "basic" } } } },
            }
            for server, config in pairs(servers) do
                vim.lsp.config(server, config)
                vim.lsp.enable(server)
            end
            vim.lsp.enable("lua_ls")
            local ensure_installed = vim.tbl_keys(servers or {})
            vim.list_extend(
                ensure_installed,
                { "stylua", "prettierd", "prettier", "beautysh", "ast_grep", "ruff" }
            )
            require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
            require("mason").setup({})
            require("mason-lspconfig").setup({ ensure_installed = {}, automatic_installation = false })
        end,
    },
}
