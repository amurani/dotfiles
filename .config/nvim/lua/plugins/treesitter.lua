-- Treesitter — syntax highlighting, indentation, and auto-closing HTML/JSX tags.
-- Pinned to the stable `master` branch (the legacy `main`-branch default is a
-- rewrite with a different API). The lockfile pins the exact commit either way.
return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSUpdate", "TSInstall", "TSInstallInfo" },
		dependencies = {
			"windwp/nvim-ts-autotag", -- auto close/rename JSX/HTML tags
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"cpp",
					"glimmer",
					"html",
					"java",
					"javascript",
					"json",
					"lua",
					"markdown",
					"perl",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
					"sql",
				},
				auto_install = true,
				highlight = { enable = true },
				indent = { enable = true },
			})

			-- Auto-close and auto-rename JSX/HTML tags (previously the treesitter
			-- `autotag` option; now its own plugin).
			require("nvim-ts-autotag").setup()
		end,
	},
}
