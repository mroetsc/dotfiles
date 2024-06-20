-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "html", "cssls", "pyright", "jinja_lsp", "yamlls", "bashls", "twiggy_language_server" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- typos lsp
lspconfig.typos_lsp.setup({
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,

  init_options = {
    config = '~/.config/nvim/lua/configs/sub/typos_lsp.toml',
    diagnosticSeverity = "Warning"
  }
})
