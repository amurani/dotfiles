-- File explorer: neo-tree (replaces both NERDTree and netrw.nvim).
-- Hidden files are shown by default (matching the old NERDTreeShowHidden=1).
return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<C-n>", "<Cmd>Neotree toggle<CR>", desc = "Toggle file explorer" },
			{ "<leader>e", "<Cmd>Neotree toggle<CR>", desc = "Toggle file [e]xplorer" },
		},
		opts = {
			close_if_last_window = true,
			filesystem = {
				filtered_items = {
					visible = true, -- show hidden/dotfiles
					hide_dotfiles = false,
					hide_gitignored = false,
				},
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
		},
	},
}
