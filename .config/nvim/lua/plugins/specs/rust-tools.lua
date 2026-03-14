return {
	{
		"mfussenegger/nvim-dap",
	},

	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},

	{
		"mrcjkb/rustaceanvim",
		lazy = false,
		init = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							cargo = {
								features = "all",
							},
							rustfmt = {
								overrideCommand = { "dx", "fmt", "-f", "-" },
							},
						},
					},
				},
			}
		end,
	},
}
