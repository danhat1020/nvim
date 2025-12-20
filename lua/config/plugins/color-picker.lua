return {
    "danhat1020/colorscheme-picker.nvim",
    lazy = false,
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    config = function()
        require("colorscheme-picker").setup({
            picker = "fzf-lua",
            include_stock = false,
            colors = {
                transparent = true,
                cursor_line = "#101010",
                line_number_current = "#e0e0e0",
                line_number = "#242424",
                comment = "#606060",
                inc_search = "#f0c460",
            },
            style = {
                bold = false,
                italic = false,
                underline = true,
            },
            keymaps = {
                pick = "<leader>cs",
                print = "<leader>cp",
            },
        })
    end,
}
