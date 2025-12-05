return {
	"NvChad/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			filetypes = {
				"css",
				"html",
				"javascript",
			},
			tailwind = true,
			css = true,
			always_update = true,
		})
	end,
}
