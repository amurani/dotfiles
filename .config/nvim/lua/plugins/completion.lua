-- Completion: blink.cmp (modern engine) with LuaSnip + friendly-snippets.
return {
	-- Snippet engine + snippet collection. Keeps the previous LuaSnip keymaps.
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
			local ls = require("luasnip")
			vim.keymap.set({ "i" }, "<C-K>", function()
				ls.expand()
			end, { silent = true, desc = "Expand snippet" })
			vim.keymap.set({ "i", "s" }, "<C-L>", function()
				ls.jump(1)
			end, { silent = true, desc = "Next snippet placeholder" })
			vim.keymap.set({ "i", "s" }, "<C-J>", function()
				ls.jump(-1)
			end, { silent = true, desc = "Prev snippet placeholder" })
			vim.keymap.set({ "i", "s" }, "<C-E>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { silent = true, desc = "Cycle snippet choice" })
		end,
	},

	-- Completion engine.
	{
		"saghen/blink.cmp",
		version = "*", -- release tag ships a prebuilt fuzzy-matcher binary
		event = "InsertEnter",
		dependencies = { "L3MON4D3/LuaSnip" },
		opts = {
			snippets = { preset = "luasnip" },
			-- Keymap mirrors the previous nvim-cmp setup as closely as possible.
			keymap = {
				preset = "none",
				["<CR>"] = { "accept", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide", "fallback" },
				["<C-d>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-p>"] = { "select_prev", "fallback" },
				["<C-n>"] = { "select_next", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
			},
			completion = {
				-- Preselect the first item so <CR> confirms it (matches the old
				-- cmp.confirm({ select = true }) behavior).
				list = { selection = { preselect = true, auto_insert = false } },
				documentation = { auto_show = true },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
