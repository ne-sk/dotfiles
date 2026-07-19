vim.pack.add({ "https://github.com/lervag/vimtex" })

vim.g.vimtex_view_method = "zathura"

vim.g.vimtex_compiler_method = "latexmk"

vim.g.vimtex_quickfix_mode = 0

-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = "tex",
-- 	callback = function()
-- 		vim.b.maplocalleader = "\\"
-- 	end,
-- })

vim.g.vimtex_mappings_prefix = "<localleader>l"
