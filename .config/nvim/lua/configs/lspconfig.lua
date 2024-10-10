local nvlsp = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

require("nvchad.configs.lspconfig").defaults()

-- List of servers to configure with default settings
local servers = {
  "html", "cssls", "pyright", "jinja_lsp", "yamlls", "bashls",
  "twiggy_language_server", "tsserver"
}

-- Configure servers with default settings
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Special configuration for typos_lsp
lspconfig.typos_lsp.setup({
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  init_options = {
    config = '~/.config/nvim/lua/configs/sub/typos_lsp.toml',
    diagnosticSeverity = "Warning"
  }
})
