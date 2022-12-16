local overrides = require "custom.plugins.configs.overrides"

return {

  -- enable dashboard
  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = overrides.alpha,
  },
  -- smooth scrolling, or use "karb94/neoscroll.nvim"
  ["declancm/cinnamon.nvim"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "cinnamon.nvim"
    end,
    config = function()
      require("custom.plugins.configs.others").cinnamon()
    end,
  },
  -- a pretty diagnostics, references, telescope results, quickfix and location list
  ["folke/trouble.nvim"] = {
    cmd = "TroubleToggle",
    config = function()
      require("trouble").setup()
    end,
    setup = function()
      require("core.utils").load_mappings "trouble"
    end,
  },
  --  improve the default vim.ui interfaces
  ["stevearc/dressing.nvim"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "dressing.nvim"
    end,
  },
  -- ✅ Highlight, list and search todo comments in your projects
  ["folke/todo-comments.nvim"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "todo-comments.nvim"
    end,
    config = function()
      require("custom.plugins.configs.others").todo_comments()
    end,
  },
  -- Better quickfix window in Neovim, polish old quickfix window.
  ["kevinhwang91/nvim-bqf"] = {
    ft = "qf",
    config = function()
      require("custom.plugins.configs.others").bqf()
    end,
  },
  -- Super fast git decorations implemented purely in lua/teal.
  ["lewis6991/gitsigns.nvim"] = {
    override_options = overrides.gitsigns,
  },
  -- Single tabpage interface for easily cycling through diffs for all modified files for any git rev.
  ["sindrets/diffview.nvim"] = {
    cmd = {'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles',
           'DiffviewFocusFiles', 'DiffviewRefresh', 'DiffviewFileHistory',
           'DiffviewLog',
    },
    requires = 'nvim-lua/plenary.nvim',
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },
  -- inject lsp
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },
  -- lsp ui
  ["glepnir/lspsaga.nvim"] = {
    after = "nvim-lspconfig",
    -- config = function()
    --   require("custom.plugins.configs.others").lspsaga()
    -- end,
    setup = function()
      require("core.utils").load_mappings "lsp_config"
    end,
  },
  -- A completion plugin for neovim coded in Lua. 
  ["hrsh7th/nvim-cmp"] = {
    override_options = overrides.cmp,
  },
  -- Portable package manager for Neovim that runs everywhere Neovim runs. 
  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  -- Nvim Treesitter configurations and abstraction layer 
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },
  -- Rainbow parentheses using treesitter
  ["p00f/nvim-ts-rainbow"] = {
    after = "nvim-treesitter",
  },
  -- Use treesitter to auto close and auto rename html tag
  ["windwp/nvim-ts-autotag"] = {
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  -- comment lines for files with different language sections: jsx, tsx, vue...
  ["JoosepAlviste/nvim-ts-context-commentstring"] = {
    after = "nvim-treesitter",
  },

  --[[ -- Debug Adapter Protocol client ]]
  --[[ ["mfussenegger/nvim-dap"] = { ]]
  --[[   cmd = "DapToggleBreakpoint", ]]
  --[[   config = function() ]]
  --[[     require "custom.plugins.configs.nvim-dap" ]]
  --[[   end, ]]
  --[[   setup = function() ]]
  --[[     require("core.utils").load_mappings "dap_config" ]]
  --[[   end, ]]
  --[[ }, ]]
  --[[ -- A UI for nvim-dap ]]
  --[[ ["rcarriga/nvim-dap-ui"] = { ]]
  --[[   after = "nvim-dap", ]]
  --[[   config = function() ]]
  --[[     require("custom.plugins.configs.others").dapui() ]]
  --[[   end, ]]
  --[[ }, ]]
  --[[ -- adds virtual text support to nvim-dap ]]
  --[[ ["theHamsta/nvim-dap-virtual-text"] = { ]]
  --[[   after = "nvim-dap", ]]
  --[[   config = function() ]]
  --[[     require("nvim-dap-virtual-text").setup() ]]
  --[[   end, ]]
  --[[ }, ]]
  --[[ -- nvim-dap adapter for vscode-js-debug ]]
  --[[ ["mxsdev/nvim-dap-vscode-js"] = { ]]
  --[[   after = "nvim-dap", ]]
  --[[   config = function() ]]
  --[[     require "custom.plugins.configs.nvim-dap-vscode-js" ]]
  --[[   end, ]]
  --[[ }, ]]
  --[[ -- The VS Code JavaScript debugger ]]
  --[[ ["microsoft/vscode-js-debug"] = { ]]
  --[[   opt = true, ]]
  --[[   run = "npm install --legacy-peer-deps && npm run compile", ]]
  --[[ }, ]]

  -- Smart and powerful comment plugin for neovim.
  ["numToStr/Comment.nvim"] = {
    override_options = overrides.comment,
  },
  -- Find, Filter, Preview, Pick. All lua, all the time. 
  ["nvim-telescope/telescope.nvim"] = {
    override_options = overrides.telescope,
  },
  -- FZF sorter for telescope written in c
  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    after = "telescope.nvim",
    run = 'make'
  },
  -- Add/change/delete surrounding delimiter pairs with ease
  ["kylechui/nvim-surround"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "nvim-surround"
    end,
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  -- tabbing out from parentheses, quotes, and similar contexts
  ["abecodes/tabout.nvim"] = {
    wants = { "nvim-treesitter" },
    after = { "nvim-cmp" },
    config = function()
      require("tabout").setup {}
    end,
  },
  -- 🌌 Next-generation motion plugin
  ["ggandor/lightspeed.nvim"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "lightspeed.nvim"
    end,
  },
  -- Getting you where you want with the fewest keystrokes.
  ["ThePrimeagen/harpoon"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "harpoon"
      require("core.utils").load_mappings "harpoon"
    end,
  },
  -- add log messages
  ["gaelph/logsitter.nvim"] = {
    ft = { "javascript", "typescript", "go", "lua" },
    after = { "nvim-treesitter" },
  },

  -- project management
  ["ahmedkhalf/project.nvim"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "project.nvim"
      require("core.utils").load_mappings "telescope"
    end,
    config = function()
      require("project_nvim").setup()
    end,
  },
  -- A task runner and job management plugin for Neovim
  ["stevearc/overseer.nvim"] = {
    cmd = { "OverseerToggle" },
    config = function()
      require("custom.plugins.configs.others").overseer()
    end,
  },
  -- markdown preview
  ["iamcco/markdown-preview.nvim"] = {
    ft = "markdown",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- Edit Readonly files
  ["lambdalisue/suda.vim"] = {
    cmd = "SudaWrite",
  },
  -- Bundle snippets from multiple sources and convert them to your format of choice
  ["smjonas/snippet-converter.nvim"] = {
    cmd = "ConvertSnippets",
    config = function()
      require("custom.plugins.configs.others").snippet_converter()
    end,
  },
}

