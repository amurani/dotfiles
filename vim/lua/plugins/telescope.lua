require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "^(node_modules|build|dist)/.*", "yarn.lock" },
	},
	extensions = {
		coc = { theme = "ayu" },
	},
})

-- require('telescope').load_extension('coc')
require("telescope").load_extension("recent_files")

-- custom keymaps
vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>bf", require("telescope.builtin").buffers, { desc = "Show [B]u[f]fers" })
