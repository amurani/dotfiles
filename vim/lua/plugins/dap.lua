-- Requires (https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#vscode-js-debug)
-- to be installed somewhere on you machine
require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "9229",
    executable = {
        command = "node",
        -- 💀 Make sure to update this path to point to your installation
        args = { "/Users/kmurani/Downloads/js-debug/src/dapDebugServer.js", "${port}" },
    }
}

require("dap").configurations.javascript = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
    },
}
