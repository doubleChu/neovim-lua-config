local M = {}

local overrides = require "custom.plugins.configs.overrides"

M.ui = {
  theme = "everforest",
  theme_toggle = { "everforest", "gruvchad" },
}

M.mappings = require "custom.mappings"

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["hrsh7th/nvim-cmp"] = overrides.cmp,
    ["nvim-treesitter/nvim-treesitter"] = overrides.treesitter,
    ["williamboman/mason.nvim"] = overrides.mason,
    ["numToStr/Comment.nvim"] = overrides.comment,
  },
}

return M
