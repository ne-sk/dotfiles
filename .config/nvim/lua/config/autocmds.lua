-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

-- persistent cursor, last position
create_autocmd("BufReadPost", {
  desc = "persistent cursor, last file position",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
      vim.schedule(function()
        vim.cmd("normal! zz")
      end)
    end
  end,
})

local auto_view = create_augroup("auto_view", { clear = true })

-- save view when closing buffer (for fold persistence)
create_autocmd({ "BufWinLeave", "BufWritePost", "WinLeave" }, {
  desc = "Save view with mkview for real files",
  group = auto_view,
  callback = function(args)
    if vim.b[args.buf].view_activated then
      vim.cmd.mkview({ mods = { emsg_silent = true } })
    end
  end,
})

-- load view when opening buffer
create_autocmd("BufWinEnter", {
  desc = "Try to load file view if available and enable view saving for real files",
  group = auto_view,
  callback = function(args)
    if not vim.b[args.buf].view_activated then
      local filetype = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
      local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
      local ignore_filetypes = { "gitcommit", "gitrebase" }
      if buftype == "" and filetype and filetype ~= "" and not vim.tbl_contains(ignore_filetypes, filetype) then
        vim.b[args.buf].view_activated = true
        vim.cmd.loadview({ mods = { emsg_silent = true } })
      end
    end
  end,
})

create_autocmd({ "FileType" }, {
  pattern = { "env" },
  callback = function()
    vim.b.autoformat = false
  end,
})
