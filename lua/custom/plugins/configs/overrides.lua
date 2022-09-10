local M = {}

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.1
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }
M.alpha = {
  header = {
    val = {
      "⠀⠀⣴⡇⢻⣿⣿⣿⣿⣿⣷⣮⡳⡝⠒⣝⢿⣌⠻⣿⣿⣇⣎⢷⣝⢿⣿⡾⣿⣿⣿⣿⣿⣿⣧⣿⡟⣸⣿⣿⣿⠋⠀⠀⠀    ⠀",
      "⢀⣾⣿⣿⢣⣟⡻⠿⣿⣿⣿⣿⣿⣦⣱⣿⣷⣝⢿⣮⣙⢿⡼⣷⣝⢷⡝⡣⢻⣿⣿⣿⣿⣿⣿⡟⣰⣿⠿⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⡼⣿⣷⢻⡎⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣝⡻⡴⣦⣹⣿⣷⣮⣹⣶⣿⣿⣿⣿⣿⠟⠀⡀⣀⣴⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⣿⣶⣏⢸⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⣿⣿⣿⡌⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⣿⣿⣿⡇⡅⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⣿⣿⣿⣿⢻⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⣿⣿⣿⣿⣼⣷⣝⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣷⣝⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⣿⣿⣿⣿⣷⢿⡿⣿⣿⣷⣽⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⣻⣭⣭⠉⢭⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⣿⣿⣿⣿⣿⣸⣧⣞⢿⣿⣿⣿⣮⣛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠀⠀⠈⠓⠤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⣿⣿⣿⣿⣿⡇⣿⣿⣎⢿⣿⣿⣿⣿⣷⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠈⠑⠤⣀⠀⠀⠀⠀⠀⠀",
      "⠸⢿⣿⣿⣿⣿⣿⣿⣏⣷⢻⣿⣿⣷⡹⣿⣿⣿⣿⣿⣿⣮⣛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠀⠀⠀⠀⠀",
      "⢸⣷⣮⣟⠿⣿⣿⣿⣿⢹⣼⣿⣿⣿⣿⣎⣿⣿⣿⣿⡿⠁⠀⠁⠙⠻⣿⣿⣿⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⢸⣿⣿⣿⣿⣮⣝⡿⣿⡜⡇⣿⣿⣿⣿⣿⡜⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠙⠛⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    },
  },
  headerPaddingTop = { type = "padding", val = headerPadding },
}

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
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

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

M.comment = {
  -- commentstring
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}

M.telescope = {
  extensions_list = { "themes", "terms", "projects", "harpoon", "fzf" },
}

M.gitsigns = {
  --[[ current_line_blame = true, ]]
}

return M
