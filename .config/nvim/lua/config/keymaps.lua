local map = vim.keymap.set

map("n", "<Space>", "<Nop>")

map("n", ";", ":") -- enter command mode with ;

map("n", "q", "<Cmd>q<CR>", { silent = true })
map("n", "Q", "<Cmd>q!<CR>", { silent = true })

-- Tab/Shift-Tab: Like browser tabs, feels natural
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

map("n", "m", "q") -- move macro record to m

-- Shift+HJKL to move faster than the default h/j/k/l
map({ "n", "v" }, "K", "7<Up>")
map({ "n", "v" }, "J", "7<Down>")
map({ "n", "v" }, "H", "0")
map({ "n", "v" }, "L", "$")

-- Shift+Arrows: same fast movement
map({ "n", "v" }, "<S-Up>", "<Esc>7<Up>")
map({ "n", "v" }, "<S-Down>", "<Esc>7<Down>")
map({ "n", "v" }, "<S-Left>", "<Esc>0")
map({ "n", "v" }, "<S-Right>", "<Esc>$")

-- Move between windows with Ctrl+hjkl or Ctrl+Arrows (like tmux)
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "<C-Left>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Smart j/k: moves by visual lines when no count, real lines with count
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Better line start/end (more comfortable than $ and ^)
map("n", "gl", "$", { desc = "Go to end of line" })
map("n", "gh", "^", { desc = "Go to start of line" })

-- Clear search highlighting
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
map(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- Select all content
map("n", "<A-a>", "ggVG", { noremap = true, silent = true, desc = "Select all" })

-- x deletes without clobbering the unnamed register
map({ "n", "v" }, "x", '"_x')

-- Better paste (doesn't replace clipboard with deleted text)
map("v", "p", '"_dP', { noremap = true, silent = true })

-- Smart undo break-points (create undo points at logical stops)
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Save file (works in all modes)
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Create new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Quit operations
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- LSP Code Keymaps
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Code Rename" })
map("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover (alt)" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })

-- Exit terminal mode to normal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-------- conform
vim.api.nvim_create_user_command("FormatDisable", function(opts)
	if opts.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
	vim.notify("Autoformat disabled" .. (opts.bang and " (buffer)" or " (global)"), vim.log.levels.WARN)
end, { desc = "Disable autoformat-on-save", bang = true })

vim.api.nvim_create_user_command("FormatEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
	vim.notify("Autoformat enabled", vim.log.levels.INFO)
end, { desc = "Re-enable autoformat-on-save" })

local auto_format = true

vim.keymap.set("n", "<leader>uF", function()
	auto_format = not auto_format
	if auto_format then
		vim.cmd("FormatEnable")
	else
		vim.cmd("FormatDisable")
	end
end, { desc = "Toggle Autoformat (global)" })

vim.keymap.set("n", "<leader>uf", function()
	auto_format = not auto_format
	if auto_format then
		vim.cmd("FormatEnable")
	else
		vim.cmd("FormatDisable!")
	end
end, { desc = "Toggle Autoformat (buffer)" })

vim.keymap.set({ "n", "v" }, "<leader>cn", "<cmd>ConformInfo<cr>", { desc = "Conform Info" })

vim.keymap.set({ "n", "v" }, "<leader>cf", function()
	require("conform").format({ async = true }, function(err, did_edit)
		if not err and did_edit then
			vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
		end
	end)
end, { desc = "Format buffer" })

vim.keymap.set({ "n", "v" }, "<leader>cF", function()
	require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
end, { desc = "Format Injected Langs" })

-- create keybinds for only norg filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	callback = function()
		vim.keymap.set("n", "<localleader>0", "<Cmd>Neorg toc<CR>", { buffer = true })
	end,
})
