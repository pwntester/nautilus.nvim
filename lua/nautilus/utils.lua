local hsluv = require "nautilus.hsluv"

local M = {}

M.bg = "#000000"
M.fg = "#ffffff"
M.day_brightness = 0.3

function M.tbl_deep_extend(...)
  local lhs = {}
  for _, rhs in ipairs { ... } do
    for k, v in pairs(rhs) do
      if type(lhs[k]) == "table" and type(v) == "table" then
        lhs[k] = M.tbl_deep_extend(lhs[k], v)
      else
        lhs[k] = v
      end
    end
  end
  return lhs
end

function M.hex_to_rgb(hex_str)
  local hex = "[abcdef0-9][abcdef0-9]"
  local pat = "^#(" .. hex .. ")(" .. hex .. ")(" .. hex .. ")$"
  hex_str = string.lower(hex_str)

  assert(string.find(hex_str, pat) ~= nil, "hex_to_rgb: invalid hex_str: " .. tostring(hex_str))

  local r, g, b = string.match(hex_str, pat)
  return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

function M.hex_to_norm_rgb(hex_str)
  local c = M.hex_to_rgb(hex_str)
  return { c[1] / 255, c[2] / 255, c[3] / 255 }
end

---@param fg string foreground color
---@param bg string background color
---@param alpha number number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(fg, bg, alpha)
  bg = M.hex_to_rgb(bg)
  fg = M.hex_to_rgb(fg)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02X%02X%02X", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
  return M.blend(hex, bg or M.bg, math.abs(amount))
end

function M.lighten(hex, amount, fg)
  return M.blend(hex, fg or M.fg, math.abs(amount))
end

function M.brighten(color, percentage)
  local hsl = hsluv.hex_to_hsluv(color)
  local larpSpace = 100 - hsl[3]
  if percentage < 0 then
    larpSpace = hsl[3]
  end
  hsl[3] = hsl[3] + larpSpace * percentage
  return hsluv.hsluv_to_hex(hsl)
end

function M.invertColor(color)
  if color ~= "NONE" then
    local hsl = hsluv.hex_to_hsluv(color)
    hsl[3] = 100 - hsl[3]
    if hsl[3] < 40 then
      hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
    end
    return hsluv.hsluv_to_hex(hsl)
  end
  return color
end

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param tbl table key value pairs to replace in the string
function M.template(str, tbl)
  local function get_path(t, path)
    for segment in string.gmatch(path, "[^.]+") do
      if type(t) == "table" then
        t = t[segment]
      end
    end
    return t
  end
  return (str:gsub("($%b{})", function(w)
    local path = w:sub(3, -2)
    return get_path(tbl, path) or w
  end))
end

-- Template values in a table recursivly
---@param table table the table to be replaced
---@param values table the values to be replaced by the template strings in the table passed in
function M.template_table(table, values)
  -- if the value passed is a string the return templated resolved string
  if type(table) == "string" then
    return M.template(table, values)
  end

  -- If the table passed in is a table then iterate though the children and call template table
  for key, value in pairs(table) do
    table[key] = M.template_table(value, values)
  end

  return table
end

function M.terminal(theme)
  vim.g.terminal_color_0 = theme.colors.base00
  vim.g.terminal_color_1 = theme.colors.red
  vim.g.terminal_color_2 = theme.colors.green
  vim.g.terminal_color_3 = theme.colors.yellow
  vim.g.terminal_color_4 = theme.colors.blue
  vim.g.terminal_color_5 = theme.colors.magenta
  vim.g.terminal_color_6 = theme.colors.cyan
  vim.g.terminal_color_7 = theme.colors.grey

  vim.g.terminal_color_8 = theme.colors.blue_dim
  vim.g.terminal_color_9 = theme.colors.red
  vim.g.terminal_color_10 = theme.colors.green
  vim.g.terminal_color_11 = theme.colors.yellow
  vim.g.terminal_color_12 = theme.colors.blue_br
  vim.g.terminal_color_13 = theme.colors.magenta
  vim.g.terminal_color_14 = theme.colors.cyan
  vim.g.terminal_color_15 = theme.colors.white
end

function M.syntax(tbl)
  for group, colors in pairs(tbl) do
    M.highlight(group, colors)
  end
end

function M.highlight(group, color)
  local style = color.style and "gui=" .. color.style or "gui=NONE"
  local fg = color.fg and "guifg=" .. color.fg or "guifg=NONE"
  local bg = color.bg and "guibg=" .. color.bg or "guibg=NONE"
  local sp = color.sp and "guisp=" .. color.sp or ""
  -- Vim will still apply 'cterm' styles when 'termguicolors' is on.
  -- Manually clear it to provide consistent styles of CursorLine, StatusLine, and etc.
  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp .. " cterm=NONE"

  vim.cmd(hl)
  if color.link then
    vim.cmd("highlight! link " .. group .. " " .. color.link)
  end
end

function M.load(theme, exec_autocmd)
  -- only needed to clear when not the default colorscheme
  if vim.g.colors_name then
    vim.cmd "hi clear"
  end

  vim.cmd "set background=dark"
  vim.cmd "set termguicolors"
  vim.g.colors_name = theme.name

  local hlgroups = M.template_table(theme.config.hlgroups, theme.colors)
  local groups = M.tbl_deep_extend(theme.groups, hlgroups)

  M.syntax(groups)

  if theme.config.terminal_colors then
    M.terminal(theme)
  end

  if exec_autocmd then
    vim.cmd [[doautocmd ColorScheme]]
  end
end

return M
