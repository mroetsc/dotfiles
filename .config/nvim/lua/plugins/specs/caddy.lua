return {
  {
    "isobit/vim-caddyfile",
    ft = 'caddyfile',
    config = function()
    vim.filetype.add({
      pattern = {
        ['Caddyfile'] = 'caddyfile',
      },
    })
    end,
  },
}
