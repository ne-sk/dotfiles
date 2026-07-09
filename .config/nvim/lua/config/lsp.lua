vim.lsp.enable({
	"lua_ls",
	"cssls",
	"eslint",
	"html",
	"astro",
	"jsonls",
	"pyright",
	"tailwindcss",
	"texlab",
	"vtsls",
	"yamlls",
	"bashls",
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})
