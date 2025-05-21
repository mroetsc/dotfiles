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
    opts = {
      ensure_installed = require("configs.lsp_servers"),
      automatic_installation = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      local lspconfig = require("lspconfig")
      local on_attach = require("nvchad.configs.lspconfig").on_attach
      local capabilities = require("nvchad.configs.lspconfig").capabilities

      -- Setup all servers installed by mason-lspconfig
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          lspconfig[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities,
          }
        end,

        -- Special configuration for specific servers
        ["typos_lsp"] = function()
          lspconfig.typos_lsp.setup {
            on_attach = on_attach,
            capabilities = capabilities,
            init_options = {
              config = '~/.config/nvim/lua/configs/misc/typos_lsp.toml',
              diagnosticSeverity = "Warning"
            },
            filetypes = { "*" },
          }
        end,
      }
    end,
  },
}
