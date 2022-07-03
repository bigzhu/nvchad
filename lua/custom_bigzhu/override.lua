-- overriding default plugin configs!

local M = {}

M.nvimtree = {
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "l", action = "edit" },
        { key = "h", action = "edit" },
        { key = "t", action = "edit" },
      },
    },
  },
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
