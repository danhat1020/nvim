return {
	"stevearc/oil.nvim",
	config = function()
		require("oil").setup({
			columns = {},
			win_options = { signcolumn = "yes" },
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = true,
			constrain_cursor = "name",
			watch_for_changes = true,
			view_options = { show_hidden = true },
		})
		vim.keymap.set("n", "-", ":Oil<CR>", { silent = true })
	end,
}
