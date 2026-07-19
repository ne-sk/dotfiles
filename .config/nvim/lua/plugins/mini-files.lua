vim.pack.add({ "https://github.com/nvim-mini/mini.files" })

require("mini.files").setup({
	windows = {
		preview = true,
		width_focus = 30,
		width_preview = 40,
	},
})

vim.keymap.set("n", "<leader>e", function()
	require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
end, { desc = "Open mini in current file dir" })
