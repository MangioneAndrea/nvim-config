function FormatFile()
	if
	    vim.bo.filetype == "javascript"
	    or vim.bo.filetype == "typescript"
	    or vim.bo.filetype == "typescriptreact"
	    or vim.bo.filetype == "javascriptreact"
	    or vim.bo.filetype == "svelte"
	    or vim.bo.filetype == "json"
	then
		vim.cmd(":Prettier<CR>")
	else
		vim.lsp.buf.format({ timeout_ms = 200 })
	end
end
