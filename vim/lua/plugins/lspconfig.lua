local lspconfig = require("lspconfig")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)

		-- I hate that I am doing this, but TS imports on typescript
		vim.keymap.set("n", "<C-S-p>", function()
			local clients = vim.lsp.get_clients({ bufnr = 0 })
			for _, client in ipairs(clients) do
				if client.name == "typescript-language-server" or client.name == "tsserver" then
					client:exec_cmd({
						title = "[TS] Organize Imports",
						command = "_typescript.organizeImports",
						arguments = { vim.fn.expand("%:p") },
					})
					break
				end
			end
		end, opts)
	end,
})

-- language servers
local language_servers = {
	graphql = {},
	kotlin_language_server = {
		filetypes = { "kotlin", "kt", "kts" },
		cmd = {
			os.getenv("HOME") .. "/.local/share/nvim/mason/bin/kotlin-language-server",
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},

				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
					checkThirdParty = false,
				},
			},
		},
	},
	perlnavigator = {
		settings = {
			perlnavigator = {
				perlPath = "perl",
				enableWarnings = true,
				perltidyProfile = "",
				perlcriticProfile = "",
				perlcriticEnabled = true,
			},
		},
	},
	tsserver = {
		filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
		cmd = { "typescript-language-server", "--stdio" },
	},
	typos_lsp = {
		init_options = {
			diagnosticSeverity = "Information", -- or "Information", "Hint"
		},
	},
}
for language_server, config in pairs(language_servers) do
	lspconfig[language_server].setup(config)
end

-- /language servers

-- diagnostics
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end)
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

local diagnostic_icons = {
	[vim.diagnostic.severity.ERROR] = "✘",
	[vim.diagnostic.severity.WARN] = "",
	[vim.diagnostic.severity.INFO] = "",
	[vim.diagnostic.severity.HINT] = "󰌶",
}

vim.diagnostic.config({
	virtual_text = {
		prefix = "",
	},
	update_in_insert = true,
	float = {
		source = true, -- Or "if_many"
	},
	underline = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
	signs = {
		text = diagnostic_icons,
	},
})

vim.fn.sign_define(
	"DiagnosticSignError",
	{ text = diagnostic_icons[vim.diagnostic.severity.ERROR], texthl = "DiagnosticSignError" }
)
vim.fn.sign_define(
	"DiagnosticSignWarn",
	{ text = diagnostic_icons[vim.diagnostic.severity.WARN], texthl = "DiagnosticSignWarn" }
)
vim.fn.sign_define(
	"DiagnosticSignInfo",
	{ text = diagnostic_icons[vim.diagnostic.severity.INFO], texthl = "DiagnosticSignInfo" }
)
vim.fn.sign_define(
	"DiagnosticSignHint",
	{ text = diagnostic_icons[vim.diagnostic.severity.HINT], texthl = "DiagnosticSignHint" }
)
-- /diagnostics
