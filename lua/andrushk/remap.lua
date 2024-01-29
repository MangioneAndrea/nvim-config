vim.g.mapleader = " "
-- Open file tree
vim.keymap.set("n", "<leader>-", vim.cmd.Ex)

-- Add ctrl + s to save and go to normal mode
vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("i", "<C-s>", "<esc>:w<CR>")

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Moving half page leaves the cursor in the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Paste doesn't override the buffer with the highlighted line(s)
vim.keymap.set("x", "p", "\"_dP")

-- System clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>p", "\"+p")
vim.keymap.set("v", "<leader>p", "\"+p")

-- replace all occourences of the selected buffer in visual mode
vim.keymap.set("v", "<leader>s", "y:<C-U>%s/<C-r><C-r>\"/<C-r><C-r>\"/gI<Left><Left><Left>")
-- replace all occourences in the open repository
vim.keymap.set("v", "<leader>s", "y:<C-U>%s/<C-r><C-r>\"/<C-r><C-r>\"/gI<Left><Left><Left>")

-- format
vim.keymap.set("n", "<leader>f", function()
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
 )

-- show help (signature)
vim.keymap.set('n', '<leader>h', "<C-wk>")

-- debugger
vim.keymap.set("n", "<leader>dbg", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
