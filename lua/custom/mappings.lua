local M = {}

M.snippets = {
  -- n = {
  --   ["cll"] = {
  --     "yiwoconsole.log({})<Esc>==F{p",
  --     "正常模式中的console.log，在下一行上插入括号内的单词",
  --   },
  -- },
  -- i = {
  --   ["cll"] = { "console.log({})<Esc>==F{a", "插入模式中的console.log，焦点放在括号内" },
  -- },
  -- v = {
  --   ["cll"] = {
  --     "yoconsole.log({})<Esc>==F{p",
  --     "可视模式中的console.log，在下一行输出选中的内容",
  --   },
  -- },
}

M.mswin = {
  n = {
    ["<C-q>"] = { "<C-v>", "Do visual-block section" },
    ["<C-x>"] = { "dd", "Cut a line" },
    ["<C-c>"] = { "yy", "Copy a line" },
    ["<C-v>"] = { '"+gP', "Paste" },
    ["<C-a>"] = { "gggH<C-o>G", "Select All" },
    ["<leader>aa"] = { "<C-a>", "Add number under cursor" },
    ["<leader>ax"] = { "<C-x>", "Aubtract number under cursor" },
  },
  i = {
    ["<C-x>"] = { "<C-o>dd", "Cut a line" },
    ["<C-c>"] = { "<C-o>yy", "Copy a line" },
    ["<C-v>"] = { '<C-o>"+gP', "Paste" },
    ["<C-a>"] = { "<C-o>gg<C-o>gH<C-o>G", "Select All" },
    ["<C-s>"] = { "<Esc>:update<CR>gi", "﬚  save file" },
    ["<C-z>"] = { "<C-o>u", "Undo" }, -- not in command line
  },
  v = {
    ["<C-x>"] = { '"+x', "Cut Section" },
    ["<C-c>"] = { '"+y', "Copy Section" },
    -- Allow paste with text was just yanked instead of what was replaced
    ["<C-v>"] = { '"+gPgvy', "Paste" },
    ["<C-s>"] = { "<Esc>:update<CR>gv", "﬚  save file" },
    ["<BS>"] = { "d", "Delete section" },
    ["<leader>aa"] = { "<C-a>", "Add number in the highlighted text" },
    ["<leader>ax"] = { "<C-x>", "Subtract number in the highlighted text" },
    ["<leader>gaa"] = { "g<C-a>", "Add number in the highlighted text as incrementing sequence" },
    ["<leader>gax"] = { "g<C-x>", "Subtract number in the highlighted text as decrementing sequence" },
  },
}

M.operation = {
  n = {
    -- Resize with arrows
    ["<C-Up>"] = { "<cmd> resize -2<CR>", "Resize up" },
    ["<C-Down>"] = { "<cmd> resize +2<CR>", "Resize down" },
    ["<C-Left>"] = { "<cmd> vertical resize -2<CR>", "Resize left" },
    ["<C-Right>"] = { "<cmd> vertical resize +2<CR>", "Resize right" },
    -- Move text up and down
    ["<A-j>"] = { "<cmd> m .+1<CR>==", "Move text down" },
    ["<A-k>"] = { "<cmd> m .-2<CR>==", "Move text up" },
  },
  i = {
    ["<A-j>"] = { "<Esc><cmd> m .+1<CR>==gi", "Move text down" },
    ["<A-k>"] = { "<Esc><cmd> m .-2<CR>==gi", "Move text up" },
  },
  v = {
    ["<"] = { "<gv", "Better indenting left" },
    [">"] = { ">gv", "Better indenting right" },
    -- Move current line / block with Alt-j/k ala vscode.
    ["<A-j>"] = { ":m '>+1<CR>gv=gv", "Move text down" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv", "Move text up" },
  },
}

--[[ M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>/"] = { "<Nop>", "" },
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },

  v = {
    ["<leader>/"] = { "<Nop>", "" },
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').locked('toggle.linewise')(vim.fn.visualmode())<CR>gv",
      "toggle comment",
    },
  },
} ]]

M.lsp_config = {
  -- lspsaga keymap
  plugin = true,

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
    ["<leader>f"] = {
      "<cmd> Lspsaga show_cursor_diagnostics <CR>",
      "   show diagnostics",
    },
    ["<leader>d"] = {
      "<cmd> Lspsaga peek_definition <CR>",
      "   lsp peek definition",
    },
    ["<leader>lo"] = {
      "<cmd> Lspsaga outline <CR>",
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

--[[ M.dap_config = { ]]
--[[   plugin = true, ]]
--[[]]
--[[   n = { ]]
--[[     -- Debug keymapping ]]
--[[     ["<leader>tb"] = { "<cmd> DapToggleBreakpoint <CR>", "Toggle Breakpoint" }, ]]
--[[     ["<leader>tc"] = { "<cmd> DapContinue <CR>", "Debug Continue" }, ]]
--[[     ["<F9>"] = { "<cmd> DapStepOver <CR>", "Debug StepOver" }, ]]
--[[     ["<F10>"] = { "<cmd> DapStepInto <CR>", "Debug StepInto" }, ]]
--[[     -- Shift + F10 won't work in TUI Neovim, but can take effect in GUI neoivm ]]
--[[     ["<leader><F10>"] = { "<cmd> DapStepOut <CR>", "Debug StepOut" }, ]]
--[[     ["<leader><F12>"] = { "<cmd> DapTerminate <CR>", "Debug Terminate" }, ]]
--[[     ["<F12>"] = { ]]
--[[       function() ]]
--[[         require("dap").run_last() ]]
--[[       end, ]]
--[[       "Debug Restart", ]]
--[[     }, ]]
--[[     ["<leader>te"] = { ]]
--[[       function() ]]
--[[         require("dapui").eval() ]]
--[[       end, ]]
--[[       "Debug Evaluate Expression", ]]
--[[     }, ]]
--[[     ["<leader>tf"] = { ]]
--[[       function() ]]
--[[         require("dapui").float_element() ]]
--[[       end, ]]
--[[       "Debug Float Element", ]]
--[[     }, ]]
--[[     ["<leader>trb"] = { ]]
--[[       function() ]]
--[[         require("dap").clear_breakpoints() ]]
--[[       end, ]]
--[[       "Removes all breakpoints", ]]
--[[     }, ]]
--[[   }, ]]
--[[   v = { ]]
--[[     ["<leader>te"] = { ]]
--[[       function() ]]
--[[         require("dapui").eval() ]]
--[[       end, ]]
--[[       "Debug Evaluate Expression", ]]
--[[     }, ]]
--[[   }, ]]
--[[ } ]]

M.trouble = {
  plugin = true,

  n = {
    ["<leader>tr"] = { "<cmd> TroubleToggle <CR>", "Trouble panel toggle" },
    ["<leader>tw"] = {
      "<cmd> TroubleToggle workspace_diagnostics <CR>",
      "workspace diagnostics from the builtin LSP client",
    },
    ["<leader>tdd"] = {
      "<cmd> TroubleToggle document_diagnostics <CR>",
      "document diagnostics from the builtin LSP client",
    },
    ["<leader>tq"] = { "<cmd> TroubleToggle quickfix <CR>", "quickfix items" },
    ["<leader>tl"] = { "<cmd> TroubleToggle loclist <CR>", "items from the window's location list" },
    ["gr"] = {
      "<cmd> TroubleToggle lsp_references <CR>",
      "(Replace previous) references of the word under the cursor from the builtin LSP client",
    },
  },
}

M.harpoon = {
  plugin = true,

  n = {
    ["<leader>ba"] = {
      function()
        require("harpoon.mark").add_file()
      end,
      "Harpoon add file",
    },
    ["<leader>bb"] = {
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      "Harpoon view all project marks",
    },
    ["<leader>bn"] = {
      function()
        require("harpoon.ui").nav_next()
      end,
      "Harpoon view next mark",
    },
    ["<leader>bp"] = {
      function()
        require("harpoon.ui").nav_prev()
      end,
      "Harpoon view previous mark",
    },
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Telescope Project View" },
    ["<leader>fn"] = { "<cmd> Telescope harpoon marks <CR>", "Telescope Harpoon mark View" },
    ["<leader>fg"] = { "<cmd> Telescope grep_string <CR>", "Telescope grep string" },
  },
}

return M
