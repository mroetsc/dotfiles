return {
  'gorbit99/codewindow.nvim',
  lazy = false,
  config = function()
    local codewindow = require('codewindow')
    codewindow.setup({
      active_in_terminals = false,
      auto_enable = false,
      exclude_filetypes = { 'help' },
      max_minimap_height = nil,
      max_lines = nil,
      minimap_width = 20,
      use_lsp = true,
      use_treesitter = true,
      use_git = true,
      width_multiplier = 4,
      z_index = 1,
      show_cursor = true,
      screen_bounds = 'lines',
      window_border = 'single',
      relative = 'win',
      events = { 'TextChanged', 'InsertLeave', 'DiagnosticChanged', 'FileWritePost' }
    })
    codewindow.apply_default_keybinds()
  end,
}
