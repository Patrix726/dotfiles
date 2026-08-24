return {
  dir = vim.fn.stdpath 'config' .. '/lua/ui',
  lazy = false,
  priority = 900,
  config = function()
    require('ui').setup()
  end,
}
