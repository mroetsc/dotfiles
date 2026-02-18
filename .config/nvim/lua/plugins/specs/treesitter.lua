return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "vim", "lua", "vimdoc",
      "html", "css",
      "markdown", "markdown_inline",
    },
    highlight = { enable = true },
  },
}
