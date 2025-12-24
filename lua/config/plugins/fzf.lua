return {
	"ibhagwan/fzf-lua",
	config = function()
		local fzf_lua = require("fzf-lua")
		local border = "rounded"
		fzf_lua.setup({
			fzf_bin = "sk",
			winopts = {
				height = 0.6,
				width = 0.8,
				row = 0.5,
				col = 0.5,
				border = border,
				backdrop = 0,
				title = "",
				title_pos = "center",
				preview = {
					default = "builtin",
					border = border,
					winopts = {
						relativenumber = true,
					},
				},
			},
			fzf_colors = {
				true,
				["fg"] = { "fg", "Normal" },
				["bg"] = { "bg", "Normal" },
				["hl"] = { "fg", "Normal" },
				["fg+"] = { "fg", "CursorLine" },
				["bg+"] = { "bg", "CursorLine" },
				["hl+"] = { "fg", "CursorLine" },
				["info"] = { "fg", "Comment" },
				["prompt"] = { "fg", "Comment" },
				["pointer"] = { "fg", "PmenuExtra" },
				["marker"] = { "fg", "Normal" },
				["spinner"] = { "fg", "Comment" },
				["header"] = { "fg", "Comment" },
				["gutter"] = { "bg", "Normal" },
				["border"] = { "fg", "Normal" },
			},
			hls = {
				border = "Comment",
				preview_border = "Comment",
			},
		})

		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" }) -- or your preferred background
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		vim.keymap.set("n", "<leader>sf", fzf_lua.files, { silent = true, noremap = true }) -- find files in cwd
		vim.keymap.set("n", "<leader>ss", fzf_lua.live_grep, { silent = true, noremap = true }) -- grep string in cwd
		vim.keymap.set("n", "<leader>sh", fzf_lua.helptags, { silent = true, noremap = true }) -- find in help docs
		vim.keymap.set("n", "<leader>sw", fzf_lua.grep_cword, { silent = true, noremap = true }) -- grep word under cursor
		vim.keymap.set("n", "<leader>sW", fzf_lua.grep_cWORD, { silent = true, noremap = true }) -- grep WORD under cursor
		vim.keymap.set("n", "<leader>sb", fzf_lua.buffers, { silent = true, noremap = true }) -- find existing buffers
		vim.keymap.set("n", "<leader>/", fzf_lua.lgrep_curbuf, { silent = true, noremap = true }) -- grep string in current buffer
	end,
}
