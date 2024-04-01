local dap = require('dap')

for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
        -- debugger for only for single node typescript file
        language == "typescript" and {
            type = "pwa-node",
            request = "launch",
            name = "Launch *.ts file in new node process",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "ts-node",
        } or nil,
        -- debugger for only for single node javascript file
        language == "javascript" and {
            type = "pwa-node",
            request = "launch",
            name = "Launch *.js file in new node process",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            runtimeExecutable = "node", -- redundant, but I want to be explicit
        } or nil,
        -- attach to a node process that has been started with
        -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
        -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
        {
            -- use nvim-dap-vscode-js's pwa-node debug adapter
            type = "pwa-node",
            -- attach to an already running node process with --inspect flag
            -- default port: 9222
            request = "attach",
            -- allows us to pick the process using a picker
            processId = require 'dap.utils'.pick_process,
            -- name of the debug action you have to select for this config
            name = "Attach debugger to existing `node --inspect` process",
            -- for compiled languages like TypeScript or Svelte.js
            sourceMaps = true,
            resolveSourceMapLocations = {
                "${workspaceFolder}/**",
                "!**/node_modules/**" },
            cwd = "${workspaceFolder}",
            skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
        -- TODO: figure this one out
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            -- trace = true, -- include debugger info
            runtimeExecutable = "node",
            runtimeArgs = {
                "./node_modules/jest/bin/jest.js",
                "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
        }
    }
end

-- custom signs
vim.fn.sign_define('DapBreakpoint',
    { text = '🔴', texthl = '', linehl = '', numhl = '' })
-- vim.fn.sign_define('DapBreakpointRejected',
--     { text = '🟦', texthl = '', linehl = '', numhl = '' })
-- vim.fn.sign_define('DapStopped',
--     { text = '⭐️', texthl = '', linehl = '', numhl = '' })


-- adding extra deps setups here as I don't need another config for this
require("dap-vscode-js").setup({
    -- node_path = "node",                                                                          -- Path of node executable. Defaults to $NODE_PATH, and then "node"
    debugger_path = "/Users/kevinmurani/.vim/plugged/vscode-js-debug", -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = {
        'pwa-node',
    },
    log_file_path = "/tmp/dap_vscode_js.log" -- Path for file logging
    -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

-- key bindings
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle({reset = true})<CR>", { noremap = true })
