return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.keymap.set({ "n", "v" }, "<leader>e", "<Cmd>NvimTreeToggle<CR>", { desc = "Open Nvim Tree" })
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- empty setup using defaults
		require("nvim-tree").setup()
	end,
}
