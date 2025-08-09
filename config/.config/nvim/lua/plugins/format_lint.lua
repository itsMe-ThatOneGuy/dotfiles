return {
	{
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
	},
	{
		"mfussenegger/nvim-lint",
		dependencies = { "mason.nvim" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}

			vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
