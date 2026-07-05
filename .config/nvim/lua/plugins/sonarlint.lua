-- SonarLint LSP for JS/TS/Kotlin/Java. sonarlint.nvim uses the native vim.lsp
-- client internally, so no lspconfig framework is needed. The language server and
-- its analyzers are installed by mason-tool-installer (see lsp.lua).
--
-- Requires a working Java runtime. We can't just check `executable("java")`:
-- macOS ships a /usr/bin/java stub that exists but fails at runtime when no JDK
-- is installed. So we actually run `java -version` and bail if it errors, which
-- avoids sonarlint failing on every JS/TS buffer on machines without Java.
return {
	{
		url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
		ft = { "typescript", "javascript", "kotlin", "java" },
		config = function()
			vim.fn.system({ "java", "-version" })
			if vim.v.shell_error ~= 0 then
				return -- no working Java runtime; skip sonarlint silently
			end

			local pkg =
				vim.fn.expand("$HOME/.local/share/nvim/mason/packages/sonarlint-language-server")
			local jar = pkg .. "/extension/server/sonarlint-ls.jar"
			local analyzers = vim.split(
				vim.fn.glob(pkg .. "/extension/analyzers/*.jar"),
				"\n",
				{ trimempty = true }
			)

			local cmd = { "java", "-jar", jar, "-stdio", "-analyzers" }
			vim.list_extend(cmd, analyzers)

			require("sonarlint").setup({
				server = {
					cmd = cmd,
					settings = { sonarlint = {} },
					autostart = true,
				},
				filetypes = {
					"typescript",
					"javascript",
					"kotlin",
					"java",
				},
			})
		end,
	},
}
