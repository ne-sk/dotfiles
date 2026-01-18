-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.wrap = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,options,tabpages,winsize,terminal"
vim.o.breakindent = true

vim.opt.scrolloff = 8

vim.filetype.add({
  extension = {
    ["http"] = "http",
  },
})

vim.g.markdown_recommended_style = 0
