return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>mm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        "stylua",
        "shfmt",
        "prettier",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = "BufReadPre",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      local on_attach = require("nvchad.configs.lspconfig").on_attach
      local capabilities = require("nvchad.configs.lspconfig").capabilities

      -- Setup mason-lspconfig with handlers
      require("mason-lspconfig").setup({
        ensure_installed = require("configs.lsp_servers"),
        automatic_installation = true,
        handlers = {
          -- Default handler for all servers
          function(server_name)
            require("lspconfig")[server_name].setup({
              on_attach = on_attach,
              capabilities = capabilities,
            })
          end,
          -- Special handler for typos_lsp
          ["typos_lsp"] = function()
            require("lspconfig").typos_lsp.setup({
              on_attach = on_attach,
              capabilities = capabilities,
              init_options = {
                config = '~/.config/nvim/lua/configs/misc/typos_lsp.toml',
                diagnosticSeverity = "Warning"
              },
              filetypes = { "*" },
            })
          end,
        },
      })
    end,
  },
}
