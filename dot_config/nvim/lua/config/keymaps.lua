-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

map("n", "<C-a>", "ggVG", { desc = "Select all" })

map("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
