-- General editing quality-of-life plugins.
-- Note: commenting (`gc`/`gcc`) is built into Neovim 0.10+, so tcomment_vim is dropped.
return {
	-- Git gutter signs, blame, hunk actions.
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup()
		end,
	},

	-- Auto-close pairs. `map_cr = false` leaves <CR> to the completion engine.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({ map_cr = false })
		end,
	},

	-- Surround (add/delete/replace surroundings). Modern replacement for vim-sandwich.
	{
		"echasnovski/mini.surround",
		version = false,
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup()
		end,
	},

	-- Alignment (:EasyAlign / ga).
	{
		"junegunn/vim-easy-align",
		cmd = "EasyAlign",
		keys = {
			{ "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "EasyAlign" },
		},
	},

	-- Highlight trailing whitespace.
	{ "ntpeters/vim-better-whitespace", event = { "BufReadPost", "BufNewFile" } },

	-- Work with word variants / coercion (crs, cru, :Subvert, ...).
	{ "tpope/vim-abolish", event = "VeryLazy" },
}
