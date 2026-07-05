-- Formatting: conform.nvim with format-on-save (unchanged from before).
return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				java = { "google-java-format" },
				javascript = { "prettier" },
				json = { "prettier" },
				kotlin = { "ktlint" },
				lua = { "stylua" },
				perl = { "perltidy" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				-- terraform
				hcl = { "packer_fmt" },
				terraform = { "terraform_fmt" },
				tf = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },
			},
			format_on_save = true,
		},
	},
}
