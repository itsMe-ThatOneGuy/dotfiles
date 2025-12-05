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
			prettierd = {
				prepend_args = { "--single-quote", "--tab-width 4", "--use-tabs" },
			},
			prettier = {
				prepend_args = { "--single-quote", "--tab-width 4", "--use-tabs" },
			},
			injected = {
				options = {
					ignore_errors = false,
					lang_to_formatters = {
						sql = { "sqls" },
					},
					lang_to_ext = {
						sql = "sql",
					},
				},
			},
		},
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			sql = { "injected" },
		},
	},
}
