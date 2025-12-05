vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		map("gD", vim.lsp.buf.declaration, "goto Declaration")
		map("gd", vim.lsp.buf.definition, "goto definition")
		map("gI", vim.lsp.buf.implementation, "goto implementation")
		map("gr", vim.lsp.buf.references, "goto reference")
		map("<leader>la", vim.lsp.buf.code_action, "code action")
		map("K", vim.lsp.buf.hover, "Hover Doc")
		map("<leader>rn", vim.lsp.buf.rename, "rename")

		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})
