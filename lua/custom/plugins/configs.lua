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
return M
