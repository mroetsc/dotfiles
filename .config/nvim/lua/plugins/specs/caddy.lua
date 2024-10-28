return {
  {
    "isobit/vim-caddyfile",
    event = { "BufRead" },
    config = function()
      vim.bo.filetype = "caddyfile"
    end,
  },
}
