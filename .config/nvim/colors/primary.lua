-- Primary.lua
-- A Neovim colorscheme derived from the "Primary" Obsidian theme
-- (light-mode palette, converted from its HSL variables to hex)

-- Loaded automatically by Neovim when you run :colorscheme primary

local palette = {
	bg = "#F8F5F1",
	bg_alt = "#F2ECE3",
	bg_float = "#EEE7DD",
	selection = "#EBE3D6",
	border = "#E4D7C3",

	fg = "#593E22",
	fg_alt = "#7B6242",
	comment = "#B79D7B",
	faint = "#9D8062",

	red = "#DF453A",
	green = "#329562",
	yellow = "#D79719",
	blue = "#22729B",
	magenta = "#744596",
	cyan = "#4CAEAA",

	red_br = "#DF453A",
	green_br = "#3EB174",
	yellow_br = "#ECB936",
	blue_br = "#2A90CB",
	magenta_br = "#9F72BB",
	cyan_br = "#71C1BE",
}

do
	local p = palette

	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end

	vim.o.termguicolors = true
	vim.o.background = "light"
	vim.g.colors_name = "primary"

	local hl = function(group, opts)
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- Editor UI
	hl("Normal", { fg = p.fg, bg = p.bg })
	hl("NormalFloat", { fg = p.fg, bg = p.bg_float })
	hl("FloatBorder", { fg = p.border, bg = p.bg_float })
	hl("Cursor", { fg = p.bg, bg = p.fg })
	hl("CursorLine", { bg = p.bg_alt })
	hl("CursorLineNr", { fg = p.fg, bold = true })
	hl("LineNr", { fg = p.comment })
	hl("SignColumn", { fg = p.comment, bg = p.bg })
	hl("ColorColumn", { bg = p.bg_alt })
	hl("Visual", { bg = p.selection })
	hl("VisualNOS", { bg = p.selection })
	hl("Search", { fg = p.fg, bg = p.yellow_br })
	hl("IncSearch", { fg = p.bg, bg = p.yellow })
	hl("Pmenu", { fg = p.fg, bg = p.bg_float })
	hl("PmenuSel", { fg = p.bg, bg = p.blue })
	hl("PmenuSbar", { bg = p.bg_alt })
	hl("PmenuThumb", { bg = p.comment })
	hl("StatusLine", { fg = p.fg, bg = p.bg_alt })
	hl("StatusLineNC", { fg = p.faint, bg = p.bg_alt })
	hl("TabLine", { fg = p.faint, bg = p.bg_alt })
	hl("TabLineSel", { fg = p.fg, bg = p.bg })
	hl("TabLineFill", { bg = p.bg_alt })
	hl("VertSplit", { fg = p.border })
	hl("WinSeparator", { fg = p.border })
	hl("Folded", { fg = p.faint, bg = p.bg_alt })
	hl("MatchParen", { fg = p.red, bold = true })
	hl("NonText", { fg = p.comment })
	hl("Whitespace", { fg = p.border })
	hl("Directory", { fg = p.blue })
	hl("Title", { fg = p.fg, bold = true })
	hl("ErrorMsg", { fg = p.red, bold = true })
	hl("WarningMsg", { fg = p.yellow })
	hl("ModeMsg", { fg = p.fg })
	hl("MoreMsg", { fg = p.green })
	hl("Question", { fg = p.green })

	-- Diagnostics
	hl("DiagnosticError", { fg = p.red })
	hl("DiagnosticWarn", { fg = p.yellow })
	hl("DiagnosticInfo", { fg = p.blue })
	hl("DiagnosticHint", { fg = p.cyan })
	hl("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
	hl("DiagnosticUnderlineWarn", { undercurl = true, sp = p.yellow })
	hl("DiagnosticUnderlineInfo", { undercurl = true, sp = p.blue })
	hl("DiagnosticUnderlineHint", { undercurl = true, sp = p.cyan })

	-- Diffs
	hl("DiffAdd", { bg = "#E2EEE3" })
	hl("DiffChange", { bg = "#EAEADD" })
	hl("DiffDelete", { bg = "#F3E2DE" })
	hl("DiffText", { bg = "#DCE7DE" })

	-- Syntax
	hl("Comment", { fg = p.comment, italic = true })
	hl("Constant", { fg = p.magenta })
	hl("String", { fg = p.green })
	hl("Character", { fg = p.green })
	hl("Number", { fg = p.magenta })
	hl("Boolean", { fg = p.magenta })
	hl("Float", { fg = p.magenta })
	hl("Identifier", { fg = p.fg })
	hl("Function", { fg = p.blue, bold = true })
	hl("Statement", { fg = p.red })
	hl("Conditional", { fg = p.red })
	hl("Repeat", { fg = p.red })
	hl("Label", { fg = p.red })
	hl("Operator", { fg = p.fg_alt })
	hl("Keyword", { fg = p.red, bold = true })
	hl("Exception", { fg = p.red })
	hl("PreProc", { fg = p.yellow })
	hl("Include", { fg = p.yellow })
	hl("Define", { fg = p.yellow })
	hl("Macro", { fg = p.yellow })
	hl("PreCondit", { fg = p.yellow })
	hl("Type", { fg = p.yellow, bold = true })
	hl("StorageClass", { fg = p.yellow })
	hl("Structure", { fg = p.yellow })
	hl("Typedef", { fg = p.yellow })
	hl("Special", { fg = p.cyan })
	hl("SpecialChar", { fg = p.cyan })
	hl("Tag", { fg = p.blue })
	hl("Delimiter", { fg = p.fg_alt })
	hl("SpecialComment", { fg = p.comment, bold = true })
	hl("Underlined", { underline = true })
	hl("Ignore", { fg = p.faint })
	hl("Error", { fg = p.red, bold = true })
	hl("Todo", { fg = p.bg, bg = p.yellow, bold = true })

	-- Treesitter (fallback to matching groups for a consistent look)
	hl("@variable", { fg = p.fg })
	hl("@variable.builtin", { fg = p.magenta })
	hl("@function", { link = "Function" })
	hl("@function.builtin", { fg = p.blue })
	hl("@keyword", { link = "Keyword" })
	hl("@keyword.function", { fg = p.red })
	hl("@string", { link = "String" })
	hl("@number", { link = "Number" })
	hl("@boolean", { link = "Boolean" })
	hl("@comment", { link = "Comment" })
	hl("@type", { link = "Type" })
	hl("@constant", { link = "Constant" })
	hl("@constant.builtin", { fg = p.magenta, bold = true })
	hl("@punctuation", { fg = p.fg_alt })
	hl("@tag", { link = "Tag" })
	hl("@property", { fg = p.blue })
	hl("@field", { fg = p.blue })

	-- Git
	hl("DiffAdded", { fg = p.green })
	hl("DiffRemoved", { fg = p.red })
	hl("GitSignsAdd", { fg = p.green })
	hl("GitSignsChange", { fg = p.yellow })
	hl("GitSignsDelete", { fg = p.red })

	-- Terminal colors (used by :terminal and some plugins)
	vim.g.terminal_color_0 = p.bg_alt
	vim.g.terminal_color_1 = p.red
	vim.g.terminal_color_2 = p.green
	vim.g.terminal_color_3 = p.yellow
	vim.g.terminal_color_4 = p.blue
	vim.g.terminal_color_5 = p.magenta
	vim.g.terminal_color_6 = p.cyan
	vim.g.terminal_color_7 = p.fg_alt
	vim.g.terminal_color_8 = p.comment
	vim.g.terminal_color_9 = p.red_br
	vim.g.terminal_color_10 = p.green_br
	vim.g.terminal_color_11 = p.yellow_br
	vim.g.terminal_color_12 = p.blue_br
	vim.g.terminal_color_13 = p.magenta_br
	vim.g.terminal_color_14 = p.cyan_br
	vim.g.terminal_color_15 = p.fg
end
