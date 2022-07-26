local M = {}

local pluginConfs = require "custom.plugins.configs"

M.ui = {
  theme = "everforest",
}

M.mappings = require "custom.mappings"

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["hrsh7th/nvim-cmp"] = pluginConfs.cmp,
  },
}

return M
