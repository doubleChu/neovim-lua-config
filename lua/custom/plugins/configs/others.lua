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
  local options = {
    template = {
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
    },
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

return M
