return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters = {
			prettier = {
				prepend_args = { "--single-quote", "--tab-width 4", "--use-tabs" },
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
		},
	},
}
