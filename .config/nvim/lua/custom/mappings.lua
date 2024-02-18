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

    ["<M-Left>"] = { function() require("smart-splits").move_cursor_left() end, "Move to left split" },
    ["<M-Up>"] = { function() require("smart-splits").move_cursor_down() end, "Move to below split" },
    ["<M-Down>"] = { function() require("smart-splits").move_cursor_up() end, "Move to above split" },
    ["<M-Right>"] = { function() require("smart-splits").move_cursor_right() end, "Move to right split" },
    ["<C-Up>"] = { function() require("smart-splits").resize_up() end, "Resize split up" },
    ["<C-Down>"] = { function() require("smart-splits").resize_down() end, "Resize split down" },
    ["<C-Left>"] = { function() require("smart-splits").resize_left() end, "Resize split left" },
    ["<C-Right>"] = { function() require("smart-splits").resize_right() end, "Resize split right" },
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
