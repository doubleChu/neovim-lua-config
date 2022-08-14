-- GUI setting
vim.opt.guifont = (function()
  local gui_font = "font_family:font_size"
  if vim.fn.has "win32" == 1 then
    gui_font = "CaskaydiaCove NF:h14"
  else
    gui_font = "CaskaydiaCove Nerd Font:h20"
  end
  return gui_font
end)()

-- Neovide setting
if vim.g.neovide then
  vim.g.neovide_transparency = 0.85
  vim.g.neovide_profiler = false
end

-- NVUI setting
if vim.g.nvui then
  vim.cmd [[NvuiOpacity 0.9]]
  vim.cmd [[NvuiFrameless 1]]
  vim.cmd [[NvuiTitlebarFontFamily Cascadia Code]]
  vim.cmd [[NvuiTitlebarFontSize 12]]
  vim.opt.guifont = "CaskaydiaCove NF:h14,Microsoft YaHei:h14"
end
