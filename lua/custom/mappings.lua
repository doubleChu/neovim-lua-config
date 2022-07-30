local M = {}

M.snippets = {
  n = {
    ["cll"] = {
      "yiwoconsole.log({})<Esc>0f{a<Esc>p",
      "正常模式中的console.log，在下一行上插入括号内的单词",
    },
  },
  i = {
    ["cll"] = { "console.log({})<Esc>0f{a", "插入模式中的console.log，焦点放在括号内" },
  },
  v = {
    ["cll"] = {
      "yoconsole.log({})<Esc>0f{a<Esc>p",
      "可视模式中的console.log，在下一行输出选中的内容",
    },
  },
}

M.operation = {
  n = {
    ["<C-q>"] = { "<C-v>", "Do visual-block section" },
    ["<C-x>"] = { "dd", "Cut a line" },
    ["<C-c>"] = { "yy", "Copy a line" },
    ["<C-v>"] = { '"+gP', "Paste" },
    ["<C-a>"] = { "gggH<C-o>G", "Select All" },
  },
  i = {
    ["<C-x>"] = { "<C-o>dd", "Cut a line" },
    ["<C-c>"] = { "<C-o>yy", "Copy a line" },
    ["<C-v>"] = { '"+gP', "Paste" },
    ["<C-a>"] = { "<C-o>gg<C-o>gH<C-o>G", "Select All" },
    ["<C-s>"] = { "<Esc>:update<CR>gi", "﬚  save file" },
    ["<C-z>"] = { "<C-o>u", "Undo"}, -- not in command line
  },
  v = {
    ["<C-x>"] = { '"+x', "Cut Section" },
    ["<C-c>"] = { '"+y', "Copy Section" },
    ["<C-v>"] = { '"+gP', "Paste" },
    ["<C-s>"] = { "<C-c>:update<CR>", "﬚  save file" },
    ["<BS>"] = { "d", "Delete section" },
  },
  c = {
    ["<C-v>"] = { "<C-r>+", "Paste" },
  }
}

M.lspconfig = {
  -- lspsaga keymap
  n = {
    ["<leader>ca"] = {
      "<cmd> Lspsaga code_action <CR>",
      "   lsp code_action",
    },
    ["[d"] = {
      "<cmd> Lspsaga diagnostic_jump_prev <CR>",
      "   goto prev",
    },

    ["]d"] = {
      "<cmd> Lspsaga diagnostic_jump_next <CR>",
      "   goto_next",
    },
    ["<leader>ra"] = {
      "<cmd> Lspsaga rename <CR>",
      "   lsp rename",
    },
    ["<leader>d"] = {
      "<cmd> Lspsaga preview_definition <CR>",
      "   lsp preview definition",
    },
    ["<leader>lo"] = {
      "<cmd> LSoutlineToggle <CR>",
      "   lsp outline",
    },
  },
  v = {
    ["<leader>r"] = {
      function()
        local old_func = vim.go.operatorfunc
        _G.op_func_formatting = function()
          local start = vim.api.nvim_buf_get_mark(0, "[")
          local finish = vim.api.nvim_buf_get_mark(0, "]")
          vim.lsp.buf.range_formatting({}, start, finish)
          vim.go.operatorfunc = old_func
          _G.op_func_formatting = nil
        end
        vim.go.operatorfunc = "v:lua.op_func_formatting"
        vim.api.nvim_feedkeys("g@", "n", false)
      end,
      "   lsp range formatting",
    },
  },
}

return M
