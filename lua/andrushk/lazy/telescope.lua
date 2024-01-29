return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		requires = 'plenary.nvim',
		config = function()
			require('telescope').setup({})
			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
			vim.keymap.set('n', '<C-p>', builtin.git_files, {})

			-- This command requires ripgrep. https://github.com/mrLuisFer/neovim-dotfiles/blob/main/README.md#--ripgrep
			vim.keymap.set('n', '<C-f>', function()
				builtin.grep_string({search=vim.fn.input("Search in repo > ")})
			end)
		end
	}
}
