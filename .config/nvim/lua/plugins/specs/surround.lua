return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
  keys = {
    { "ys", desc = "Add surrounding" },
    { "ds", desc = "Delete surrounding" },
    { "cs", desc = "Change surrounding" },
  },
}
