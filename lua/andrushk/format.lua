function FormatFile()
	if
	    vim.bo.filetype == "js"
	    or vim.bo.filetype == "ts"
	    or vim.bo.filetype == "jsx"
	    or vim.bo.filetype == "tsx"
	    or vim.bo.filetype == "svelte"
	    or vim.bo.filetype == "json"
	then
		vim.cmd(":Prettier<CR>")
	else
		vim.lsp.buf.format({ timeout_ms = 200 })
	end
end
