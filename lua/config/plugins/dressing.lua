return {
	"stevearc/dressing.nvim",
	config = function()
		require("dressing").setup({
			input = { trim_prompt = false },
		})
	end,
}
