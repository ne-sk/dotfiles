vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })
-- dependencies = { "nvim-tree/nvim-web-devicons" },
local edge_theme = require("lualine.themes.edge")

for _, mode in pairs(edge_theme) do
	for _, section in pairs(mode) do
		section.gui = "none"
	end
end

require("lualine").setup({
	options = {
		theme = edge_theme,
		-- ...any other options you already have
	},
	tabline = {
		lualine_a = { "buffers" },
		lualine_z = { "branch" },
	},
})
