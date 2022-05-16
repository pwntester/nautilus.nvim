local theme = require("nautilus.theme").apply({
  mode = "default"
})

local colors = theme.colors

return {
  normal = {
    a = { bg = colors.bg, fg = colors.white },
    b = { bg = colors.bg, fg = colors.blue_dim },
    c = { bg = colors.bg, fg = colors.yellow }
  },
  insert = {
    a = { bg = colors.bg, fg = colors.white },
    b = { bg = colors.bg, fg = colors.blue_dim },
    c = { bg = colors.bg, fg = colors.yellow }
  },
  visual = {
    a = { bg = colors.bg, fg = colors.white },
    b = { bg = colors.bg, fg = colors.blue_dim },
    c = { bg = colors.bg, fg = colors.yellow }
  },
  replace = {
    a = { bg = colors.bg, fg = colors.white },
    b = { bg = colors.bg, fg = colors.blue_dim },
    c = { bg = colors.bg, fg = colors.yellow }
  },
  command = {
    a = { bg = colors.bg, fg = colors.white },
    b = { bg = colors.bg, fg = colors.blue_dim },
    c = { bg = colors.bg, fg = colors.yellow }
  },
  inactive = {
    a = { bg = colors.bg, fg = colors.white },
    b = { bg = colors.bg, fg = colors.blue_dim },
    c = { bg = colors.bg, fg = colors.yellow }
  }
}
