return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "vim", "lua", "vimdoc",
      "html", "css",
      "markdown", "markdown_inline",
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    -- Treat .mdx files as markdown
    vim.filetype.add({
      extension = {
        mdx = "markdown",
      },
    })
  end,
}
