return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = "markdown",
  keys = {{ "<leader>mt", "<cmd>RenderMarkdown toggle<CR>", desc = "Toggle Markdown Render" }},
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
}
