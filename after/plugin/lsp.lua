local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	'rust_analyzer',
	'tailwindcss',
	'jdtls',
	'clangd',
})


-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

local cmp = require('cmp')
local cmp_select = {bahavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-Space>"] = cmp.mapping.complete(),
	["<Tab>"] = cmp.mapping.confirm({select=true})
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})



lsp.set_preferences({
	sign_icons = {}
})

lsp.on_attach(function(client ,bufnr)
	local opts = {buffer=bufnr, remap =false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()


-- show diagnostic inline
vim.diagnostic.config({
    virtual_text = true,
})
