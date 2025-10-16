return {
  "hedyhli/outline.nvim",
  lazy = false,
  config = function()
    vim.keymap.set("n", "<leader>lo", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" })
    vim.keymap.set("n", "<leader>lf", "<cmd>OutlineFocus<CR>",
      { desc = "Toggle Outline Focus" })

    require("outline").setup {
    }
  end,
}
