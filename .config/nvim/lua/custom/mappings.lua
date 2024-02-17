---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    }

  },
  v = {
    [">"] = { ">gv", "indent"},
  },
}

-- more keybinds!

-- Lazygit
M.LazyGit = {
  n= {
    ["<leader>gg"] = {":LazyGit<CR>", "Open LazyGit", opts = { noremap = true }}
  },
}

return M
