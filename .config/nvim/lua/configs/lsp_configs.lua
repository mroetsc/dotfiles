vim.lsp.config("typos_lsp", {
    cmd = { "typos-lsp" },
    cmd_env = { RUST_LOG = "error" },
    init_options = {
        config = '~/.config/nvim/lua/configs/misc/typos_lsp.toml',
        diagnosticSeverity = "Info"
    }
})
