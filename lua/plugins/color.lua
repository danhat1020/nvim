return {
	"vague-theme/vague.nvim",

	config = function()
		require("vague").setup({
			colors = {
				bg = "none",
				inactiveBg = "#161616",
				func = "#8088a0",
				string = "#c0a8d8",
				number = "#80a0b0",
				comment = "#a8a8a8",
				visual = "#282828",
				line = "#121212",
			},
		})

		vim.cmd.colorscheme("vague")

		-- additional highlighting
		vim.api.nvim_set_hl(0, "IncSearch", { fg = "#121212", bg = "#d0c0b0" })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#606060" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#484848" })
		local colors = { "#C06060", "#C0A060", "#60A0C0", "#A0B0C0" }
		local bg = { "#301818", "#302818", "#182830", "#282C30" }
		for i, group in ipairs({ "Error", "Warn", "Info", "Hint" }) do
			vim.api.nvim_set_hl(0, "Diagnostic" .. group, { fg = colors[i] })
			vim.api.nvim_set_hl(0, "DiagnosticUnderline" .. group, { underline = true, sp = colors[i] })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualText" .. group, { fg = colors[i], bg = bg[i] })
		end
	end,
}
