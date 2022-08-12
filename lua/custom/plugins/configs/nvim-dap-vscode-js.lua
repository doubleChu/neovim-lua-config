local present1, dap = pcall(require, "dap")

local present2, dapvscodejs = pcall(require, "dap-vscode-js")

if not (present1 and present2) then
  return
end

local options = {
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
}

dap.configurations.javascript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
  },
  -- {
  --   type = "pwa-node",
  --   request = "attach",
  --   name = "Attach",
  --   processId = require("dap.utils").pick_process,
  -- },
}
dap.configurations.typescript = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    runtimeExecutable = "deno",
    runtimeArgs = { "run", "--inspect-brk", "-A", "${file}" },
    attachSimplePort = 9229,
  },
  -- {
  --   type = "pwa-node",
  --   request = "attach",
  --   name = "Attach",
  --   processId = require("dap.utils").pick_process,
  --   runtimeExecutable = "deno",
  --   runtimeArgs = { "run", "--inspect-brk", "-A", "${file}" },
  --   attachSimplePort = 9229,
  -- },
}

dapvscodejs.setup(options)
