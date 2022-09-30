local theme = require("nautilus.theme").apply({
  mode = "octonauts",
})

local colors = theme.colors
local bg = colors.blue6
local fg = "#FFFFFF"

return {
  normal = {
    a = { bg = bg, fg = fg },
    b = { bg = bg, fg = fg },
    c = { bg = bg, fg = fg }
  },
  insert = {
    a = { bg = bg, fg = fg },
    b = { bg = bg, fg = fg },
    c = { bg = bg, fg = fg }
  },
  visual = {
    a = { bg = bg, fg = fg },
    b = { bg = bg, fg = fg },
    c = { bg = bg, fg = fg }
  },
  replace = {
    a = { bg = bg, fg = fg },
    b = { bg = bg, fg = fg },
    c = { bg = bg, fg = fg }
  },
  command = {
    a = { bg = bg, fg = fg },
    b = { bg = bg, fg = fg },
    c = { bg = bg, fg = fg }
  },
  inactive = {
    a = { bg = bg, fg = fg },
    b = { bg = bg, fg = fg },
    c = { bg = bg, fg = fg }
  }
}
