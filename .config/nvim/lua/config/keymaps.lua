-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<C-a>", "ggVG", { desc = "Select all" })

map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- make arrows behave the same as hjkl for pane navigation
local opts = { noremap = true, silent = true }
map("n", "<C-Left>", "<C-w>h", opts)
map("n", "<C-Down>", "<C-w>j", opts)
map("n", "<C-Right>", "<C-w>l", opts)
map("n", "<C-Up>", "<C-w>k", opts)

-- make s-left and s-right behave the same as H and L
map("n", "<S-Left>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "<S-Right>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })

-- keep cursor centered
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-d>", "<C-d>zz", opts)
