return {
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["williamboman/mason.nvim"] = {
    ensure_installed = {
      "cspell",
      -- lua stuff
      "lua-language-server",
      "stylua",
      "luacheck",

      -- web dev
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "eslint-lsp",
      "deno",
      "prettier",
      "emmet-ls",
      "json-lsp",

      -- shell
      "shfmt",
      "shellcheck",
    },
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
    after = { "nvim-treesitter" },
  },
  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("neoscroll").setup()
    end,
  },
  ["lewis6991/gitsigns.nvim"] = {
    config = function()
      require("gitsigns").setup()
    end,
  },
}
