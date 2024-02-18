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

-- Lazygit
M.LazyGit = {
  n= {
    ["<leader>gg"] = {":LazyGit<CR>", "Open LazyGit", opts = { noremap = true }}
  },
}

-- tmux / nvim navigation
M.tmuxNav = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },
  }
}

-- Window Splits
M.Splits = {
  n = {
    ["|"] = { "<cmd> vsplit<CR>", "Vertical split" },
    ["\\"] = { "<cmd> split<CR>", "Horizontal split" },
  }
}

M.nvimtree = {
  plugin = true,

  n = {
    -- toggle
    ["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- focus
    ["<leader>e"] = {
      function()
        if vim.fn.bufname():match 'NvimTree_' then
          vim.cmd.wincmd 'p'
        else
          vim.cmd('NvimTreeFocus')
        end
      end,
      "Toggle Nvimtree focus"
    }
  }
}

return M
