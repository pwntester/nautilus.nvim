local theme = require("nautilus.theme").apply({
  mode = "octonauts",
})

local colors = theme.colors
local bg = colors.bg

return {
  normal = {
    a = { bg = bg, fg = colors.white },
    b = { bg = bg, fg = colors.blue_dim },
    c = { bg = bg, fg = colors.yellow }
  },
  insert = {
    a = { bg = bg, fg = colors.white },
    b = { bg = bg, fg = colors.blue_dim },
    c = { bg = bg, fg = colors.yellow }
  },
  visual = {
    a = { bg = bg, fg = colors.white },
    b = { bg = bg, fg = colors.blue_dim },
    c = { bg = bg, fg = colors.yellow }
  },
  replace = {
    a = { bg = bg, fg = colors.white },
    b = { bg = bg, fg = colors.blue_dim },
    c = { bg = bg, fg = colors.yellow }
  },
  command = {
    a = { bg = bg, fg = colors.white },
    b = { bg = bg, fg = colors.blue_dim },
    c = { bg = bg, fg = colors.yellow }
  },
  inactive = {
    a = { bg = bg, fg = colors.white },
    b = { bg = bg, fg = colors.blue_dim },
    c = { bg = bg, fg = colors.yellow }
  }
}
