vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
})

require("blink.cmp").setup({
	keymap = {
		preset = "default",

		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		-- ["<Up>"] = { "select_prev", "fallback" },
		-- ["<Down>"] = { "select_next", "fallback" },
		["<CR>"] = { "accept", "fallback" },
		--
		-- ["<C-u>"] = { "scroll_documentation_up", "fallback" },
		-- ["<C-d>"] = { "scroll_documentation_down", "fallback" },
		--
		-- ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		-- ["<C-e>"] = { "hide", "fallback" },
	},
	appearance = {
		nerd_font_variant = "mono",
		use_nvim_cmp_as_default = true,
	},
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 600 },
		list = { selection = { preselect = false, auto_insert = false } },
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})
