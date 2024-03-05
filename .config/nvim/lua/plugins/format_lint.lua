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
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		dependencies = { "mason.nvim" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				javascript = { "eslint" },
				javascriptreact = { "eslint" },
				typescript = { "eslint" },
				typescriptreact = { "eslint" },
			}

			vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
