return {
  "obsidian-nvim/obsidian.nvim",
  -- version = "", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in the next major release
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/obsidian-vault/",
      },
    },
    attachments = {
      folder = "attachments",
    },
    frontmatter = {
      enabled = false,
    },
    note = {
      template = vim.NIL,
    },
    -- Optional, customize how names/IDs for new notes are created.
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      if title == nil then
        return require("obsidian").util.zettel_id()
      end
      return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    end,
  },
}
