local M = {}

M.toggle_bufferline = function()
  if vim.o.showtabline ~= 0 then
    vim.o.showtabline = 0
  else
    vim.o.showtabline = 2
  end
end

return M
