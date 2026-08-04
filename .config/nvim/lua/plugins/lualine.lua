vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
	options = {
		theme = "gruvbox-material",
		-- ...any other options you already have
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
			},
		},
		lualine_z = { "branch" },
	},
})
