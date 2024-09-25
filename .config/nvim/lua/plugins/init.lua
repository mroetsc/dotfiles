return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

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
  			"html-lsp", "css-lsp" , "prettier",
        "pyright", "jinja-lsp", "rust-analyzer",
        "codelldb", "yaml-language-server", "typos-lsp",
        "bash-language-server", "twiggy-language-server",
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "twig",
        "latex",
  		},
  	},
  },

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
  },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },},
        DEBUG = { icon = " ", color = "#fc520a" },
        TODO = { icon = " ", color = "#43bbc6" },
        HACK = { icon = " ", color = "warning" },
        WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
      },
      highlight = {
        multiline = true,
        multiline_pattern = "^.",
        multiline_context = 10,
        before = "",
        keyword = "wide",
        after = "",
        pattern = [[.*<(KEYWORDS)\s*:]],
        comments_only = true,
        max_line_len = 400,
        exclude = {},
      },
    }
  },

  {
    "Glench/Vim-Jinja2-Syntax",
    ft = "jinja",
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
    "MeanderingProgrammer/render-markdown.nvim",
    ft = "markdown",
    opts = {},
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },

  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   opts = {
  --     provider = "claude",
  --     claude = {
  --       model = "claude-3-haiku-20240307",
  --       temperature = 0,
  --       max_tokens = 1000,
  --     },
  --   },
  --   keys = {
  --     { "<leader>kt", function() require("avante.api").ask() end, desc = "avante: ask", mode = { "n", "v" } },
  --     { "<leader>kr", function() require("avante.api").refresh() end, desc = "avante: refresh" },
  --     { "<leader>ke", function() require("avante.api").edit() end, desc = "avante: edit", mode = "v" },
  --   },
  --   dependencies = {
  --     "stevearc/dressing.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "MunifTanjim/nui.nvim",
  --     "nvim-tree/nvim-web-devicons",
  --     {
  --       "HakonHarnes/img-clip.nvim",
  --       event = "VeryLazy",
  --       opts = {
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --         },
  --       },
  --     },
  --     {
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { "markdown", "Avante" },
  --       },
  --       ft = { "markdown", "Avante" },
  --     },
  --   },
  -- },

  {
    "lervag/vimtex",
    ft = "tex",
    init = function()
      vim.cmd("filetype plugin indent on")
      vim.cmd("syntax enable")
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_fold_enabled = true

      vim.g.vimtex_compiler_latexmk = {
          options = {
            '--auxdir=./build',
          }
      }
    end
  },
}
