-- LSP: native Neovim 0.11 client (vim.lsp.config / vim.lsp.enable), with mason for
-- installing servers/tools and nvim-lspconfig only as the source of default server
-- configs. Replaces the deprecated require('lspconfig') framework and lspsaga.
return {
	-- Mason: installer for LSP servers, formatters, linters, DAP adapters.
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = {
			-- "prepend" puts mason's bin dir on PATH so tools resolve without a
			-- separate PATH change (fixes the old spawn failures).
			PATH = "prepend",
		},
	},

	-- Auto-install the non-LSP tools (formatters / linters / DAP adapters).
	-- This is what makes tool installs self-heal on a fresh machine.
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
				"eslint_d",
				"ktlint",
				"google-java-format",
				"js-debug-adapter",
				"sonarlint-language-server", -- launched manually by sonarlint.nvim
			},
			run_on_start = true,
		},
	},

	-- glance.nvim: peek/preview window for definitions & references (the lspsaga
	-- feature worth keeping). `gp` opens a floating peek.
	{
		"dnlhc/glance.nvim",
		cmd = "Glance",
		opts = {},
	},

	-- The actual LSP configuration.
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "saghen/blink.cmp" }, -- for completion capabilities
		},
		config = function()
			-- Completion capabilities from blink.cmp, applied to every server.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok, blink = pcall(require, "blink.cmp")
			if ok then
				capabilities = blink.get_lsp_capabilities(capabilities)
			end
			vim.lsp.config("*", { capabilities = capabilities })

			-- Per-server overrides. nvim-lspconfig ships the base config for each
			-- (lsp/<name>.lua); these tables are merged on top.
			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
						},
					},
				},
				ts_ls = {
					filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
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
				typos_lsp = {
					init_options = { diagnosticSeverity = "Information" },
				},
				kotlin_language_server = {
					filetypes = { "kotlin", "kt", "kts" },
				},
			}
			for name, cfg in pairs(servers) do
				vim.lsp.config(name, cfg)
			end

			-- Install the servers we want; mason-lspconfig's automatic_enable then
			-- calls vim.lsp.enable() for each installed server.
			require("mason").setup({ PATH = "prepend" })
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"graphql",
					"jdtls",
					"jsonls",
					"kotlin_language_server",
					"lua_ls",
					"perlnavigator",
					"ts_ls",
					"typos_lsp",
				},
				automatic_enable = true,
			})

			-- Diagnostics presentation (icons + behavior from the previous config).
			local diagnostic_icons = {
				[vim.diagnostic.severity.ERROR] = "✘",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "󰌶",
			}
			vim.diagnostic.config({
				virtual_text = { prefix = "" },
				update_in_insert = true,
				float = { source = true },
				underline = { severity = { min = vim.diagnostic.severity.WARN } },
				signs = { text = diagnostic_icons },
			})

			-- Global diagnostic mappings (work without an attached client).
			vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, { desc = "Diagnostic float" })
			vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Line diagnostics" })
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.jump({ count = -1, float = true })
			end, { desc = "Prev diagnostic" })
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, { desc = "Next diagnostic" })
			vim.keymap.set("n", "<C-j>", function()
				vim.diagnostic.jump({ count = 1, float = true })
			end, { desc = "Next diagnostic" })

			-- Buffer-local mappings, set when a language server attaches.
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = desc })
					end

					-- Navigation
					map("n", "gd", vim.lsp.buf.definition, "Go to definition")
					map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
					map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
					map("n", "<space>D", vim.lsp.buf.type_definition, "Type definition")
					map("n", "gr", function()
						require("telescope.builtin").lsp_references()
					end, "References (Telescope)")
					map("n", "gp", "<Cmd>Glance definitions<CR>", "Peek definition (Glance)")

					-- Docs / signature
					map("n", "K", vim.lsp.buf.hover, "Hover documentation")
					map({ "n", "i" }, "<C-k>", vim.lsp.buf.signature_help, "Signature help")

					-- Refactor
					map({ "n", "v" }, "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
					map({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, "Code action")

					-- Workspace folders
					map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, "Add workspace folder")
					map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, "Remove workspace folder")
					map("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, "List workspace folders")

					-- TypeScript: organize imports
					map("n", "<C-S-p>", function()
						for _, client in ipairs(vim.lsp.get_clients({ bufnr = ev.buf })) do
							if
								client.name == "ts_ls"
								or client.name == "typescript-language-server"
								or client.name == "tsserver"
							then
								client:exec_cmd({
									title = "[TS] Organize Imports",
									command = "_typescript.organizeImports",
									arguments = { vim.fn.expand("%:p") },
								})
								break
							end
						end
					end, "Organize TS imports")
				end,
			})
		end,
	},
}
