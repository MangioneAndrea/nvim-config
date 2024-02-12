return {
	{ 'nvim-lua/plenary.nvim', name = "plenary" },
	{
		'tpope/vim-commentary'
	},
	{
		'declancm/cinnamon.nvim',
		config = function()
			require('cinnamon').setup { default_delay = 3 }
			vim.keymap.set('n', 'gd', "<Cmd>lua Scroll('definition')<CR>")
			-- Add scrilling on half page scroll to avoid people dizziness looking at my screen
			vim.keymap.set({ 'n', 'x' }, '<C-u>',
				"<Cmd>lua Scroll('<C-u>', 1, 1)<CR><Cmd>lua Scroll('zz', 0, 1)<CR>")
			vim.keymap.set({ 'n', 'x' }, '<C-d>',
				"<Cmd>lua Scroll('<C-d>', 1, 1)<CR><Cmd>lua Scroll('zz', 0, 1)<CR>")
		end
	},
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		config = function()
			vim.cmd("colorscheme carbonfox")
		end
	},
	{
		'prettier/vim-prettier',
		run = "npm i -g prettier"
	},

}
