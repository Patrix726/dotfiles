local M = {}

M.toggle_bufferline = function()
  if vim.g.buffer_line_enabled then
    vim.o.showtabline = 0
    vim.g.buffer_line_enabled = false
  else
    vim.o.showtabline = 2
    vim.g.buffer_line_enabled = true
  end
end

return M
