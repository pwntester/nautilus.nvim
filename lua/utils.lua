local M = {}

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

return M
