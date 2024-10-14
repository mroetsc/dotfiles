return {
  "kdheepak/lazygit.nvim",
  lazy = false,
  cmd = "LazyGit",
  keys = { { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
  config = function ()
    require("lazy").setup()
  end
}
