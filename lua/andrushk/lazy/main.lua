return {
	{ 'nvim-lua/plenary.nvim', name = "plenary" },
	{
		'tpope/vim-commentary'
	},
	{
		'declancm/cinnamon.nvim',
		config = function()
			local cinnamon = require("cinnamon")
			cinnamon.setup { options = { delay = 3 } }
			vim.keymap.set('n', 'gd', function()
				cinnamon.scroll('definition')
			end)
			-- Add scrilling on half page Scroll to avoid people dizziness looking at my screen
			vim.keymap.set({ 'n', 'x' }, '<C-u>', function()
				cinnamon.scroll('<C-u>zz')
			end)
			vim.keymap.set({ 'n', 'x' }, '<C-d>', function()
				cinnamon.scroll('<C-d>zz')
			end)
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
		run = "npm i -g prettier",
		config = function()
			vim.cmd([[
				"avoid error info write to header of buffer
				let g:prettier#exec_cmd_async = 1
     		 	]])
		end,
	},
	{
		'sveltejs/prettier-plugin-svelte'
	}

}
