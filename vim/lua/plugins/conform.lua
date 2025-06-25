require("conform").setup({
	formatters_by_ft = {
		-- javascript = { "prettierd", "prettier", stop_after_first = true },
		java = { "google-java-format" },
		javascript = { "prettier" },
		json = { "prettier" },
		kotlin = { "ktlint" },
		lua = { "stylua" },
		perl = { "perltidy" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
	},
	format_on_save = true,
})
