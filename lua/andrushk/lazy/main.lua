return {
	{ 'nvim-lua/plenary.nvim', name = "plenary" },
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
