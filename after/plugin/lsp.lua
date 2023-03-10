local lsp = require("lsp-zero")
lsp.preset("recommended")
lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	'rust_analyzer',
	'tailwindcss',
	'jdtls',
	'clangd'
})


-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
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
