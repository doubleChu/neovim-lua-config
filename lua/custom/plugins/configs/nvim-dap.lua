local present, dap = pcall(require, "dap")

if not present then
  return
end

vim.fn.sign_define("DapBreakpoint", {
  text = "🔴",
  texthl = "LspDiagnosticsSignError",
  linehl = "",
  numhl = "",
})
vim.fn.sign_define("DapBreakpointRejected", {
  text = "",
  texthl = "LspDiagnosticsSignHint",
  linehl = "",
  numhl = "",
})
vim.fn.sign_define("DapStopped", {
  text = "",
  texthl = "LspDiagnosticsSignInformation",
  linehl = "DiagnosticUnderlineInfo",
  numhl = "LspDiagnosticsSignInformation",
})
