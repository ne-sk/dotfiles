vim.pack.add({ "https://github.com/folke/lazydev.nvim" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	once = true, -- only need to configure it the first time
	callback = function()
		require("lazydev").setup({
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		})
	end,
})
