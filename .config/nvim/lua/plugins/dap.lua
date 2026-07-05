-- Debugging (DAP) for JavaScript/TypeScript via js-debug-adapter (installed by
-- mason-tool-installer). Replaces the removed node-debug2-adapter and the manual
-- ~/vscode-js-debug clone; the Jest and Playwright configs are preserved.
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
			"theHamsta/nvim-dap-virtual-text",
		},
		keys = {
			{ "<leader>db", "<Cmd>DapToggleBreakpoint<CR>", desc = "[D]ap toggle [b]reakpoint" },
			{ "<leader>dr", "<Cmd>DapToggleRepl<CR>", desc = "[D]ap toggle [r]epl" },
			{ "<leader>dc", "<Cmd>DapContinue<CR>", desc = "[D]ap [c]ontinue" },
			{
				"<leader>dt",
				function()
					require("dapui").toggle({ reset = true })
				end,
				desc = "[D]ap [t]oggle UI",
			},
		},
		config = function()
			local dap = require("dap")
			dap.set_log_level("ERROR")

			-- js-debug adapter (server mode). `js-debug-adapter` resolves via mason's
			-- prepended PATH.
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "js-debug-adapter",
					args = { "${port}" },
				},
			}

			local js_configurations = {
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach to existing `node --inspect` process",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug Jest Tests",
					cwd = "${workspaceFolder}",
					runtimeExecutable = "node",
					runtimeArgs = {
						"--inspect-brk",
						"node_modules/jest/bin/jest.js",
						"--no-coverage",
						"--runInBand",
						"${file}",
					},
					console = "integratedTerminal",
					internalConsoleOptions = "neverOpen",
					skipFiles = { "<node_internals>/**/*.js", "node_modules" },
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug Playwright test",
					cwd = "${workspaceFolder}/api-tests",
					runtimeExecutable = "yarn",
					runtimeArgs = { "playwright", "test", "${file}" },
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch current file in new node process",
					program = "${file}",
					cwd = "${workspaceFolder}",
					sourceMaps = true,
				},
			}

			dap.configurations.javascript = js_configurations
			dap.configurations.typescript = js_configurations
			dap.configurations.javascriptreact = js_configurations
			dap.configurations.typescriptreact = js_configurations

			-- Breakpoint sign.
			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })

			-- UI: open/close automatically with the debug session.
			local dapui = require("dapui")
			dapui.setup()
			require("nvim-dap-virtual-text").setup()
			vim.g.dap_virtual_text = true

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},

	-- Test coverage in the sign column.
	{
		"andythigpen/nvim-coverage",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "Coverage", "CoverageLoad", "CoverageToggle", "CoverageSummary" },
		config = function()
			require("coverage").setup()
		end,
	},
}
