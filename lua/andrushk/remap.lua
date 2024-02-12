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
-- This is overridden by cinnamon, so it is here as backup
-- if the plugin is disabled
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
end)

vim.keymap.set("v", "<leader>f", function()
	local range = { start = vim.fn.getpos("'<"), ["end"] = vim.fn.getpos("'>") }
	vim.lsp.buf.format({ timeout_ms = 200, range })
end)

-- references
vim.keymap.set('n', "<leader>n", ":lua vim.lsp.buf.references()<CR>")

vim.keymap.set('n', "<leader>h", vim.lsp.buf.hover)

-- quicklist up
vim.keymap.set('n', "<C-w><C-k>", "<C-w><C-w>k<CR>")
-- quicklist down
vim.keymap.set('n', "<C-w><C-j>", "<C-w><C-w>j<CR>")

-- debugger
vim.keymap.set("n", "<leader>dbg", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
