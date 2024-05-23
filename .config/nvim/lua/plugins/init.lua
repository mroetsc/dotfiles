return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    config = function ()
      require("lazy").setup()
    end
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
  },

  {
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
  },

  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.cmd("filetype plugin indent on")
      vim.cmd("syntax enable")
      vim.g.vimtex_view_method = 'zathura'

      vim.g.vimtex_compiler_latexmk = {
          options = {
            '--auxdir=./build',
          }
      }
    end
  },
}
