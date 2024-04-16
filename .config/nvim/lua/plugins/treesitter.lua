return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/nvim-treesitter-context",
		},
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"javascript",
					"json",
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"html",
					"css",
				},
				sync_install = false,
				modules = {},
				ignore_install = {},
				auto_install = true,
				indent = { enable = true },
				highlight = { enable = true },
				autotag = {
					enable = true,
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<CR>",
						node_incremental = "<TAB>",
						scope_incremental = "<CR>",
						node_decremental = "<S-TAB>",
					},
				},
			})

			vim.keymap.set("n", "[c", function()
				require("treesitter-context").go_to_context(vim.v.count1)
			end, { silent = true })
		end,
	},
}
