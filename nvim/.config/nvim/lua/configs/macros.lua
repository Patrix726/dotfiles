local M = {}

local log_table = {
  javascript = 'console.log',
  javascriptreact = 'console.log',
  typescript = 'console.log',
  typescriptreact = 'console.log',
  python = 'print',
}

M.log = function()
  if log_table[vim.bo.filetype] then
    return 'yo' .. log_table[vim.bo.filetype] .. '("",)<Esc>2hP2lp'
  else
    Snacks.notify.error('No log support for ' .. vim.bo.filetype .. ' filetype')
    return 'yo'
  end
end

return M
