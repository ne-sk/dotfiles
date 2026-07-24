vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
})
local everforest = require("lualine.themes.everforest")

for _, mode in pairs(everforest) do
	for _, section in pairs(mode) do
		section.gui = "none"
	end
end

require("lualine").setup({
	options = {
		theme = everforest,
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
