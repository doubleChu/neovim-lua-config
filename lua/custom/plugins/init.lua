return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  -- 编辑只读文件
  ["lambdalisue/suda.vim"] = {
    cmd = "SudaWrite",
  },
  ["abecodes/tabout.nvim"] = {
    config = function()
      require("tabout").setup {}
    end,
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" },
  },
  ["iamcco/markdown-preview.nvim"] = {
    ft = "markdown",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- 开启dashboard
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["glepnir/lspsaga.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      local saga = require "lspsaga"
      saga.init_lsp_saga {
        -- need neovim 0.8+, not for now
        -- symbol_in_winbar = {
        --    in_custom = true,
        -- },
      }
    end,
  },
  ["gaelph/logsitter.nvim"] = {
    ft = { "javascript", "typescript", "go", "lua" },
    after = { "nvim-treesitter" },
  },
  ["karb94/neoscroll.nvim"] = {
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    config = function()
      require("neoscroll").setup()
    end,
  },
  ["ahmedkhalf/project.nvim"] = {
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    config = function()
      require("project_nvim").setup()
    end,
  },
  ["smjonas/snippet-converter.nvim"] = {
    cmd = "ConvertSnippets",
    config = function()
      -- require("luasnip.loaders.from_vscode").load(opts)
      local template = {
        name = "Remove-License-Snippets",
        sources = {
          vscode_luasnip = { "./friendly-snippets" },
        },
        output = {
          vscode_luasnip = {
            vim.fn.stdpath "data" .. "/site/pack/packer/opt/friendly-snippets/snippets",
            opts = {
              generate_package_json = false,
            },
          },
        },
        transform_snippets = function(snippet, _)
          if
            snippet.path:match "global%.json$" and snippet.trigger:match "[Ll]icense"
            or (snippet.description and snippet.description:match "[Ll]icense")
          then
            return false
          end
        end,
      }
      require("snippet_converter").setup {
        templates = { template },
      }
    end,
  },
  ["mfussenegger/nvim-dap"] = {
    cmd = "DapToggleBreakpoint",
    config = function()
      local pluginConfs = require "custom.plugins.configs"
      require('dap')
      vim.fn.sign_define("DapBreakpoint", pluginConfs.dap_config.dap_sign_define.breakpoint)
      vim.fn.sign_define("DapBreakpointRejected", pluginConfs.dap_config.dap_sign_define.breakpoint_rejected)
      vim.fn.sign_define("DapStopped", pluginConfs.dap_config.dap_sign_define.stopped)
    end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    after = "nvim-dap",
    config = function()
      require("dapui").setup()
      local dap, dapui = require "dap", require "dapui"
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
  ["theHamsta/nvim-dap-virtual-text"] = {
    after = "nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  ["microsoft/vscode-js-debug"] = {
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile",
  },
  ["mxsdev/nvim-dap-vscode-js"] = {
    after = "nvim-dap",
    config = function()
      require("dap-vscode-js").setup {
        -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
        -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
      }
      local dap = require "dap"
      local pluginConfs = require "custom.plugins.configs"
      dap.configurations.javascript = pluginConfs.dap_config.dap_language_configurations.javascript
      dap.configurations.typescript = pluginConfs.dap_config.dap_language_configurations.typescript
    end,
  },
}
