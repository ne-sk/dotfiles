vim.pack.add({
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("^1"),
	},
})
-- optional: provides snippets for the snippet source
-- dependencies = { "rafamadriz/friendly-snippets" },

require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
		-- ["<Up>"] = { "select_prev", "fallback" },
		-- ["<Down>"] = { "select_next", "fallback" },
		-- ["<CR>"] = { "accept", "fallback" },

		["<C-u>"] = { "scroll_documentation_up", "fallback" },
		["<C-d>"] = { "scroll_documentation_down", "fallback" },
		["<A-space>"] = { "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
	},
	appearance = {
		nerd_font_variant = "mono",
		use_nvim_cmp_as_default = true,
	},
	completion = {
		documentation = { auto_show = false, auto_show_delay_ms = 600 },
		list = { selection = { preselect = false, auto_insert = true } },
	},
	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lazydev", "lsp", "path", "snippets", "buffer" },
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				-- make lazydev completions top priority (see `:h blink.cmp`)
				score_offset = 100,
			},
		},
	},

	fuzzy = { implementation = "prefer_rust_with_warning" },
})
