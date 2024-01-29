vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup("somename", {}),
	callback = function(ev)
		local opts = { buffer = ev.bufnr, remap = false }
		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	end
})

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim", "williamboman/mason.nvim",
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-vsnip',
		'hrsh7th/vim-vsnip',
		'j-hui/fidget.nvim'
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				'tsserver',
				'eslint',
				'lua_ls',
				'rust_analyzer',
				'tailwindcss',
				'jdtls',
				'clangd',
				'arduino_language_server'
			},

			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup {}
				end,

				['jdtls'] = function()
					local lspconfig = require("lspconfig")
					lspconfig.jdtls.setup {
						root_dir = function()
							return vim.fs.dirname(vim.fs.find(
								{ '.gradlew', '.gitignore', 'mvnw',
									'build.grade.kts' },
								{ upward = true })[1]) .. "\\"
						end
					}
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup {
						settings = {
							Lua = {
								runtime = {
									version = 'LuaJIT',
								},
								diagnostics = {
									globals = {
										'vim',
										'require'
									},
								},
								workspace = {
									library = vim.api.nvim_get_runtime_file(
										"", true),
								},
								telemetry = {
									enable = false,
								},
							},
						},
					}
				end,
			}

		})

		local cmp = require('cmp')
		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<Esc>'] = cmp.mapping.abort(),
				['<Tab>'] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' },
			}, {
				{ name = 'buffer' },
			})
		})

		require('fidget').setup({});
	end
}
