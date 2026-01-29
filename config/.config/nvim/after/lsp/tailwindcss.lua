local util = require("lspconfig.util")

return {
	experimental = {
		classRegex = {
			'class="([^"]*)"',
			'class:list="([^"]*)"',
		},
	},

	on_attach = function(client, bufnr)
		print("Tailwind attached to buffer", bufnr)
	end,
}
