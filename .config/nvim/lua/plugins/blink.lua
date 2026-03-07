return {
  {
    "saghen/blink.cmp",
    -- Make blink.cmp toogleable
    opts = function(_, opts)
      --      vim.b.completion = true

      --     opts.enabled = function()
      --       return vim.b.completion ~= false
      --     end

      -- Disable preselect and autocomplete
      opts.completion = opts.completion or {}
      opts.completion.list = opts.completion.list or {}
      opts.completion.list.selection = {
        preselect = false, -- do not preselect
        auto_insert = false, -- Do not auto insert
      }

      -- Add keymaps for navigation
      opts.keymap = opts.keymap or {}
      opts.keymap["<Tab>"] = { "select_next", "fallback" }
      opts.keymap["<S-Tab>"] = { "select_prev", "fallback" }

      return opts
    end,
  },
}
