return {
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
}
