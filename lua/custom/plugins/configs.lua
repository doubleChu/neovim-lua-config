local M = {}

M.cmp = function()
  local cmp = require "cmp"
  return {
    completion = {
      completeopt = "menu,menuone,noinsert",
    },
    mapping = {
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
  }
end

M.mason = {
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
}

M.dap_config = {
  dap_sign_define = {
    breakpoint = {
      text = "🔴",
      texthl = "LspDiagnosticsSignError",
      linehl = "",
      numhl = "",
    },
    breakpoint_rejected = {
      text = "",
      texthl = "LspDiagnosticsSignHint",
      linehl = "",
      numhl = "",
    },
    stopped = {
      text = "",
      texthl = "LspDiagnosticsSignInformation",
      linehl = "DiagnosticUnderlineInfo",
      numhl = "LspDiagnosticsSignInformation",
    },
  },
  dap_language_configurations = {
    javascript = {
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
    },
    typescript = {
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
    },
  },
}
M.treesitter = {
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than n lines, int
    -- colors for theme everforest
    colors = {
      "#e67e80",
      "#e69875",
      "#dbbc7f",
      "#a7c080",
      "#83c092",
      "#7fbbb3",
      "#d699b6",
    }, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
return M
