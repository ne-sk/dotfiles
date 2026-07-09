vim.pack.add({
	{
		src = "https://github.com/obsidian-nvim/obsidian.nvim",
		version = vim.version.range("*"), -- use latest release, remove to use latest commit
	},
})

require("obsidian").setup({
	legacy_commands = false, -- this will be removed in 4.0.0
	workspaces = {
		{
			name = "personal",
			path = "~/git-projects/notes/",
		},
	},
	daily_notes = {
		folder = "Daily",
		template = "Daily Note Template",
	},
	frontmatter = { enabled = false },
	templates = { folder = "Templates" },
	-- ui = { enable = false },
	attachments = {
		folder = "Attachments",
	},
})
