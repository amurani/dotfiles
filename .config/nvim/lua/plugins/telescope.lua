-- Telescope: fuzzy finder (with the native fzf sorter for speed).
return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"smartpde/telescope-recent-files",
		},
		keys = {
			{
				"<leader>gf",
				function()
					require("telescope.builtin").git_files()
				end,
				desc = "Search [G]it [F]iles",
			},
			{
				"<leader>bf",
				function()
					require("telescope.builtin").buffers()
				end,
				desc = "Show [B]u[f]fers",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					file_ignore_patterns = { "^(node_modules|build|dist)/.*", "yarn.lock" },
				},
			})
			pcall(telescope.load_extension, "fzf")
			pcall(telescope.load_extension, "recent_files")
		end,
	},
}
