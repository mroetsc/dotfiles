return {
  {
    "mfussenegger/nvim-dap",
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    lazy = false,
  }
}
