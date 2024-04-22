local dap = require('dap')

dap.set_log_level('ERROR')

-- see: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#node-debug2
dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
}

for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
        -- attach to a node process that has been started with
        -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
        -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
        -- the pwa-node adapter disconnected as soon as it attached to the process so we gave up on it
        {
            name = "Attach debugger to existing `node --inspect` process",
            type = 'node2',
            request = 'attach',
        },
        -- debugger for only for single node typescript file
        language == "typescript" and {
            type = "pwa-node",
            request = "launch",
            name = "Launch *.ts file in new node process",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "ts-node",
            runtimeArgs = {
                -- add/remove as needed
            }
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
        {
            type = "node2",
            request = "launch",
            name = "Debug Jest Tests",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "node",
            runtimeArgs = {
                "--inspect-brk",
                "node_modules/jest/bin/jest.js",
                "--no-coverage",
                "--runInBand", "${file}",
            },
            env = {
            },
            console = "integratedTerminal",
            port = 9229,
            timeout = 30000,
            internalConsoleOptions = "neverOpen",
            skipFiles = {
                "<node_internals>/**/*.js", "node_modules",
            }
        },
        {
            type = "pwa-node",
            request = "launch",
            name = "Debug playwright test",
            cwd = "${workspaceFolder}/api-tests",
            runtimeExecutable = "yarn",
            runtimeArgs = {
                "playwright", "test", "${file}"
            },
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
    debugger_path = os.getenv('HOME') .. "/vscode-js-debug", -- Path to vscode-js-debug installation.
    -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    adapters = {
        'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost'
    },
    log_file_path = "/tmp/dap_vscode_js.log", -- Path for file logging
    log_file_level = vim.log.levels.ERROR,    -- Logging level for output to file. Set to false to disable file logging.
    log_console_level = vim.log.levels.ERROR, -- Logging level for output to console. Set to false to disable console output.
})
require("dapui").setup()
require("nvim-dap-virtual-text").setup()
vim.g.dap_virtual_text = true

-- key bindings
vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":DapToggleRepl<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", ":DapContinue<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle({reset = true})<CR>", { noremap = true })
