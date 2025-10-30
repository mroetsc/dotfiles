return {
  'kaarmu/typst.vim',
  ft = 'typst',
  lazy = false,
  init = function()
    vim.g.typst_pdf_viewer = 'zathura'
    vim.g.typst_conceal = 1
    vim.g.typst_conceal_math = 1
    vim.g.typst_auto_close_toc = 0
    vim.g.typst_auto_open_quickfix = 1
    vim.g.typst_embedded_languages = {'python', 'bash', 'rs -> rust'}
    vim.g.typst_folding = 1
    vim.g.typst_foldnested = 1
  end,
}
