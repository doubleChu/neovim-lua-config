local M = {}

M.lspsaga = function()
  local present, saga = pcall(require, "lspsaga")

  if not present then
    return
  end

  saga.init_lsp_saga {
    -- need neovim 0.8+, not for now
    -- symbol_in_winbar = {
    --    in_custom = true,
    -- },
  }
end

M.dapui = function()
  local present1, dap = pcall(require, "dap")

  local present2, dapui = pcall(require, "dapui")

  if not (present1 and present2) then
    return
  end

  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end

  dapui.setup()
end

M.cinnamon = function()
  local present, cinnamon = pcall(require, "cinnamon")

  if not present then
    return
  end

  local options = {
    default_keymaps = true, -- Create default keymaps.
    extra_keymaps = true, -- Create extra keymaps.
    scroll_limit = 75, -- Max number of lines moved before scrolling is skipped.
  }

  cinnamon.setup(options)
end

M.snippet_converter = function()
  local present, snippet_converter = pcall(require, "snippet_converter")

  if not present then
    return
  end
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

  local options = {
    templates = { template },
  }
  snippet_converter.setup(options)
end

M.bqf = function()
  local present, bqf = pcall(require, "bqf")

  if not present then
    return
  end

  local options = {
    auto_resize_height = true,
  }

  bqf.setup(options)
end

M.todo_comments = function()
  local present, todo_comments = pcall(require, "todo-comments")

  if not present then
    return
  end

  local options = {
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = " ", color = "info" },
      -- keywords like ‘！’ or ‘？’ won't work due to some lua vim regex rules
      QUES = { icon = " ", color = "warning", alt = { "QUESTION" } },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      IMPT = { icon = "﯂ ", color = "important", alt = { "IMPORTANT", "*" } },
    },
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
      warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
      info = { "DiagnosticInfo", "#2563EB" },
      hint = { "DiagnosticHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
      important = { "#50e647" },
    },
  }

  todo_comments.setup(options)
end

M.overseer = function()
  local present, overseer = pcall(require, "overseer")

  if not present then
    return
  end
  local options = {
    task_list = {
      max_width = { 100, 0.2 },
      min_width = { 10, 0.1 },
    },
  }

  overseer.setup(options)
end
return M
