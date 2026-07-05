-- Catppuccin (macchiato flavor) — the colorscheme used previously.
return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false, -- load during startup
		priority = 1000, -- ...and before other plugins so highlights are correct
		opts = {
			flavour = "macchiato",
			integrations = {
				blink_cmp = true,
				gitsigns = true,
				lsp_trouble = false,
				mason = true,
				native_lsp = { enabled = true },
				neotree = true,
				nvim_dap_ui = true,
				telescope = { enabled = true },
				treesitter = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
}
