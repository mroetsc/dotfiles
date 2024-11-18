return {
  "lambdalisue/suda.vim",
  cmd = { "SudaRead", "SudaWrite", },
  config = function()
    vim.g.suda_smart_edit = 1  -- auto use sudo when needed
  end,
  keys = {
    { "<leader>W", ":SudaWrite<CR>", desc = "Write with sudo" },
  },
}
