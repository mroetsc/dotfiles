return {
  "folke/todo-comments.nvim",
  lazy = false,
  keys = {
    { "<leader>td", "<cmd>TodoTelescope keywords=TODO<cr>", desc = "Telescope TODO list" },
    { "<leader>tf", "<cmd>TodoTelescope keywords=FIX,DEBUG,HACK,WARN,TEST<cr>", desc = "Telescope FIX list" },
    {
      "<leader>tr", function()
        local line = vim.api.nvim_get_current_line()
        local new_line = line:gsub("^(%s*[#%%%-//%*]?%s*)(%w+:%s*)", "%1")
        vim.api.nvim_set_current_line(new_line)
      end, desc = "Remove TODO keyword"
    },
  },
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    keywords = {
      FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },},
      DEBUG = { icon = " ", color = "#fc520a" },
      TODO = { icon = " ", color = "#43bbc6" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    highlight = {
      multiline = true,
      multiline_pattern = "^.",
      multiline_context = 10,
      before = "",
      keyword = "wide",
      after = "",
      pattern = [[.*<(KEYWORDS)\s*:]],
      comments_only = true,
      max_line_len = 400,
      exclude = {},
    },
  }
}
