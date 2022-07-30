local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- b.code_actions.gitsigns,
  -- b.diagnostics.cspell,

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier,
  -- b.code_actions.eslint,
  -- b.diagnostics.eslint,
  b.code_actions.xo,
  b.diagnostics.xo,
  -- b.diagnostics.tsc,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

null_ls.setup {
  debug = true,
  sources = sources,

  -- format on save
  -- on_attach = function(client)
  --    if client.resolved_capabilities.document_formatting then
  --       vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
  --    end
  -- end,
}
