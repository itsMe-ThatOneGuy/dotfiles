return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		branch = "main",
		build = ":TSUpdate",

		dependencies = {
			"windwp/nvim-ts-autotag",
		},

		config = function()
			require("nvim-treesitter").setup()
		end,
	},
}
