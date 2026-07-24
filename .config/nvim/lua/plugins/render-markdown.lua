vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	-- 'https://github.com/nvim-mini/mini.nvim',            -- if you use the mini.nvim suite
	-- 'https://github.com/nvim-mini/mini.icons',        -- if you use standalone mini plugins
	"https://github.com/nvim-tree/nvim-web-devicons", -- if you prefer nvim-web-devicons
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})
require("render-markdown").setup({
	heading = {
		width = "block",
		position = "inline", -- icon sits inline with the heading text rather than 'overlay'
		icons = { "◉ ", "◎ ", "○ ", "✺ ", "▶ ", "⤷ " }, -- simpler markers instead of the default nerd-font icons, closer to org's bullet-style headings
		backgrounds = {}, -- empty = no background highlight color at all, just foreground/icon
	},
	bullet = {
		icons = { "●", "○", "◆", "◇" }, -- cycles through these per nesting level
		left_pad = 0,
		right_pad = 0.2, -- adds a space between the bullet icon and the text that follows
	},
	indent = {
		enabled = true,
		render_modes = false, -- only in normal/visual, not insert, by default
		per_level = 2, -- spaces of additional indent per heading level
		skip_level = 1, -- level 1 headings aren't indented (0 = indent from H1 onward too)
		skip_heading = false, -- if true, only body text indents, not the heading itself
		icon = "▎", -- optional guide character shown in the indent margin
		priority = 0,
		highlight = "RenderMarkdownIndent",
	},
}) -- only mandatory if you want to set custom options

vim.api.nvim_set_hl(0, "RenderMarkdownH1", { fg = "#e67e80", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { fg = "#e67e80", bold = true })

vim.api.nvim_set_hl(0, "RenderMarkdownH2", { fg = "#e69875", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { fg = "#e69875", bold = true })

vim.api.nvim_set_hl(0, "RenderMarkdownH3", { fg = "#dbbc7f", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { fg = "#dbbc7f", bold = true })

vim.api.nvim_set_hl(0, "RenderMarkdownH4", { fg = "#a7c080", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { fg = "#a7c080", bold = true })

vim.api.nvim_set_hl(0, "RenderMarkdownH5", { fg = "#7fbbb3", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { fg = "#7fbbb3", bold = true })

vim.api.nvim_set_hl(0, "RenderMarkdownH6", { fg = "#d699b6", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { fg = "#d699b6", bold = true })

vim.api.nvim_set_hl(0, "RenderMarkdownIndent", { fg = "#4c566a" }) -- muted, subtle — indent guides shouldn't compete with heading colors

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.breakindent = true
		vim.opt_local.breakindentopt = "shift:0"
		vim.opt_local.linebreak = true
		vim.opt_local.showbreak = ""
	end,
})
