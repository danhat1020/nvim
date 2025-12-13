return {
    "dgox16/oldworld.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("oldworld").setup({ variant = "oled", integrations = { lsp = true, markdown = true, treesitter = true } })
        vim.cmd.colorscheme("oldworld")
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#0c0c0c" })
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#303030" })
        vim.api.nvim_set_hl(0, "MatchParen", { fg = "#ffb890" })
    end,
}
