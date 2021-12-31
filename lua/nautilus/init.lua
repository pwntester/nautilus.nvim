local utils = require "nautilus.utils"

local M = {}

-- Loads colorscheme and applies the highlight groups.
-- If a name is passed it will override what was set in the configuration setup.
-- @param name string
function M.load(config)
  config.hlgroups = config.hlgroups or {}
  local theme = require("nautilus.theme").apply(config)

  utils.load(theme, true)
end

return M
