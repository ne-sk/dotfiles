local create_autocmd = vim.api.nvim_create_autocmd
local create_augroup = vim.api.nvim_create_augroup

-- persistent cursor, last position
create_autocmd('BufReadPost', {
  desc = 'persistent cursor, last file position',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
      vim.schedule(function()
        vim.cmd 'normal! zz'
      end)
    end
  end,
})

local auto_view = create_augroup('auto_view', { clear = true })

create_autocmd({ 'FileType' }, {
  pattern = { 'env' },
  callback = function()
    vim.b.autoformat = false
  end,
})
