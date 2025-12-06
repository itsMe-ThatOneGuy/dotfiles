return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls@3.15.0",
				"ts_ls",
				"html",
				"tailwindcss",
				"cssls",
				"pyright",
				"gopls",
				"sqls",
				"yamlls",
				"dockerls",
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						border = "none",
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
					log_level = vim.log.levels.INFO,
					max_concurrent_installers = 4,
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"prettier",
				"pylint",
				"eslint_d",
			},
		},
		dependencies = {
			"mason-org/mason.nvim",
		},
	},
}
