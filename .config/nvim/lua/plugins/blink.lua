return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
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
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
