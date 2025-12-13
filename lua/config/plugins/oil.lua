return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function()
        _G.oil_winbar_dir = function()
            local dir = require("oil").get_current_dir()
            dir = dir:gsub("/home/slick", "~")
            return "    " .. (dir or "")
        end
        require("oil").setup({
            skip_confirm_for_simple_edits = true,
            prompt_save_on_select_new_entry = false,
            constrain_cursor = "name",
            keymaps = { ["<Esc>"] = { "actions.close", mode = "n" }, ["<leader>cd"] = { "actions.cd", mode = "n" } },
            view_options = { show_hidden = true },
            win_options = { winbar = "%{v:lua.oil_winbar_dir()}" },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { silent = true, noremap = true })
    end,
}
