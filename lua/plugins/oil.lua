require("oil").setup({
    columns = {},
    skip_confirm_for_simple_edits = true,
    prompt_save_on_select_new_entry = false,
    constrain_cursor = "name",
    watch_for_changes = true,
    keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["<leader>cd"] = { "actions.cd", mode = "n" },
    },
    view_options = { show_hidden = true },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { silent = true, noremap = true })
