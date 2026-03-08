return {
  "nvim-mini/mini.files",
  enabled = false,
  version = "*",
  lazy = false,
  -- config = function()
  --   require("mini.files").setup()
  -- end,
  keys = {
    {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Open mini files (dir of current file)",
    },
    {
      "<leader>E",
      function()
        require("mini.files").open(nil, false)
      end,
      desc = "Open mini.files (cwd)",
    },
  },
  opts = {
    options = {
      use_as_default_explorer = true,
    },
  },
}
