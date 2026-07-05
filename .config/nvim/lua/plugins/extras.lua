-- Assorted extras carried over from the previous setup.
return {
	-- Pretty code screenshots.
	{
		"mistricky/codesnap.nvim",
		build = "make",
		cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapHighlight", "CodeSnapASCII" },
		opts = {
			mac_window_bar = false,
			has_breadcrumbs = false,
			bg_color = "#edeff3ff",
			watermark = "",
			code_font_family = "Monaco Nerd Font",
		},
	},

	-- JSDoc block generator.
	{
		"heavenshell/vim-jsdoc",
		ft = { "javascript", "javascript.jsx", "typescript", "typescript.tsx" },
		build = "make install",
	},

	-- Vim training game.
	{
		"szymonwilczek/vim-be-better",
		cmd = "VimBeBetter",
	},

	-- Internal Booking.com devtools. Only reachable on the work network, so it is
	-- gated behind an env var — set `NVIM_WORK=1` on the work machine to enable it.
	-- On other machines lazy skips it entirely (no failed clone).
	{
		url = "git@gitlab.booking.com:devtools/vim-booking.git",
		cond = function()
			return vim.env.NVIM_WORK == "1"
		end,
	},
}
