return  {
  "andweeb/presence.nvim",
  lazy = false,
  config = function()
    require("presence").setup({
      neovim_image_text = "Because Neo Vi Improved sounds too bulky",
      enable_line_number = true,
      show_time = false,
      buttons = false,
      -- buttons = { { label = "GitHub Profile", url = "https://github.com/mroetsc" } }
    })
  end,
}
