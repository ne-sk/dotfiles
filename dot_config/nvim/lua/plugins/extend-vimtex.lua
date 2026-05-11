return {
  {
    "lervag/vimtex",
    -- use `init` for vim.g.* so it's set before VimTex uses it
    init = function()
      -- these are vim regexes. match the log line(s) you want to hide
      vim.g.vimtex_quickfix_ignore_filters = {
        [[Underfull \\hbox]], -- hide underfull hbox warnings
        -- [[Overfull \\hbox]], -- (optional) hide overfull hbox warnings too
        -- [[Underfull \\vbox]], -- (optionsal) hide underfull vbox warnings too
      }
    end,
  },
}
