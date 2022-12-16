local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "html",
  "cssls",
  -- "cssmodules_ls",
  -- "stylelint_lsp",
  "eslint",
  "tsserver",
  "emmet_ls",
  -- "denols",
  "jsonls",
}

for _, lsp in ipairs(servers) do
  local lsp_setup = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  if lsp == "emmet_ls" then
    lsp_setup.filetypes = { "css", "sass", "scss", "less" }
  end
    lspconfig[lsp].setup(lsp_setup)
end
