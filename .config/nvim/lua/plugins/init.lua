local M = {}

-- Function to load all plugin files in the plugins directory
local function load_plugins()
  local plugin_dir = vim.fn.stdpath("config") .. "/lua/plugins/specs"
  local plugin_files = vim.fn.glob(plugin_dir .. "/*.lua")

  for _, file in ipairs(vim.split(plugin_files, "\n")) do
    local plugin = dofile(file)
    if type(plugin) == "table" then
      table.insert(M, plugin)
    end
  end
end

load_plugins()

return M
