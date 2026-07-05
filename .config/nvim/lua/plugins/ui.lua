-- Statusline, bufferline, indent guides, icons, start screen.
return {
	-- Icons used across the UI (statusline, bufferline, neo-tree, telescope).
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- Statusline.
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {},
				},
				sections = {
					lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
					lualine_b = { "branch", "diff" },
					lualine_c = {
						{ "filename", file_status = true, path = 0 },
					},
					lualine_x = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = { error = " ", warn = " ", info = " ", hint = " " },
						},
						"encoding",
						"filetype",
					},
					lualine_y = { "progress" },
					lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						{ "filename", file_status = true, path = 1 },
					},
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				extensions = { "fugitive", "lazy", "neo-tree", "nvim-dap-ui" },
			})

			vim.api.nvim_set_hl(0, "StatusLine", { link = "Normal" })
			vim.api.nvim_set_hl(0, "StatusLineNC", { link = "Normal" })
		end,
	},

	-- Bufferline (in tabs mode, matching the previous setup).
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
			{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Previous tab" },
		},
		config = function()
			local bufferline = require("bufferline")
			bufferline.setup({
				options = {
					mode = "tabs",
					separator_style = { "  |  ", "  |  " },
					always_show_bufferline = false,
					show_buffer_close_icons = false,
					show_close_icon = false,
					color_icons = true,
					style_preset = {
						bufferline.style_preset.no_italic,
						bufferline.style_preset.no_bold,
					},
				},
			})
		end,
	},

	-- Indent guides.
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			vim.opt.list = true
			require("ibl").setup()
		end,
	},

	-- Start screen.
	{ "mhinz/vim-startify", lazy = false },
}
