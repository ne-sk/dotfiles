local opt = vim.opt

opt.number = true -- line numbers
opt.relativenumber = true -- relative line numbers
opt.cursorline = true -- highlight current line
opt.wrap = true -- wrap text
opt.scrolloff = 10 -- keep 10 lines above/below cursor
opt.sidescrolloff = 8 -- keep 8 columns left/right of cursor

-- indentation
opt.tabstop = 2 -- tab width
opt.shiftwidth = 2 -- indent width
opt.softtabstop = 2 -- soft tab stop
opt.expandtab = true -- use spaces instead of tabs
opt.smartindent = true -- smart auto-indenting
opt.autoindent = true -- copy indent from current line
opt.breakindent = true -- indent wrapped lines

-- search settings
opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- case sensitive if uppercase in search
opt.hlsearch = false -- don't highlight search results
opt.incsearch = true -- show matches as you type

-- visual settings
opt.termguicolors = true -- enable 24-bit colours
opt.signcolumn = "yes" -- always show sign column
opt.showmatch = true -- highlight matching brackets
opt.matchtime = 2 -- how long to show matching bracket
opt.cmdheight = 1 -- command line height
opt.showmode = false -- don't show mode in command line
opt.pumheight = 10 -- popup menu height
opt.pumblend = 10 -- popup menu transparency
opt.winblend = 0 -- floating window transparency
opt.completeopt = "menu,menuone,noselect" -- control insert mode completion behaviour
opt.conceallevel = 2 -- hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.concealcursor = "" -- don't hive cursor line markup
opt.synmaxcol = 300 -- syntax highlighting limit
opt.ruler = false -- disable the default ruler
opt.virtualedit = "block" -- allow cursor to move where there is no text in visual block mode
opt.winminwidth = 5 -- minimum window width

-- file handling
opt.backup = false -- don't create backup files
opt.writebackup = false -- don't create backup before writing
opt.swapfile = false -- don't create swap files
opt.undofile = true -- persistent undo
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.vim/undodir") -- undo directory
opt.updatetime = 300 -- faster completion
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- lower than default (1000) to quickly trigger which-key
opt.ttimeoutlen = 0 -- key code timeout
opt.autoread = true -- auto reload files changed outside vim
opt.autowrite = true

-- behavior settings
opt.hidden = true -- allow hidden buffers
opt.errorbells = false -- no error bells
opt.backspace = "indent,eol,start" -- better backspace behaviour
opt.autochdir = false -- don't auto change directory
opt.iskeyword:append("-") -- treat dash as part of word
opt.path:append("**") -- include subdirectories in search
opt.selection = "exclusive" -- selection behaviour
opt.mouse = "a" --enable mouse support
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- sync with system clipboard
opt.modifiable = true -- allow buffer modifications
opt.encoding = "UTF-8" -- set encoding

-- folding settings
opt.smoothscroll = true
vim.wo.foldmethod = "expr"
opt.foldlevel = 99
opt.foldtext = ""
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- split behaviour
opt.splitbelow = true -- horizontal splits go below
opt.splitright = true -- vertical splits go right
opt.splitkeep = "screen"

-- command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- better diff options
opt.diffopt:append("linematch:60")

-- performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

vim.g.autoformat = true
vim.g.trouble_lualine = true

opt.fillchars = {
	foldopen = " ",
	foldclose = " ",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

opt.jumpoptions = "view"
opt.laststatus = 3 -- global statusline
opt.linebreak = true -- wrap lines at convenient points
opt.list = true -- show some invisible characters
opt.shiftround = true -- round indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })

vim.g.markdown_recommended_style = 0

vim.filetype.add({
	extension = {
		env = "dotenv",
	},
	filename = {
		[".env"] = "dotenv",
		["env"] = "dotenv",
	},
	pattern = {
		["[jt]sconfig.*.json"] = "jsonc",
		["%.env%.[%w_.-]+"] = "dotenv",
	},
})
