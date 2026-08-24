local M = {}
local set_colourscheme = require 'ui.theme'

M.setup = function()
  set_colourscheme()

  vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function(args)
      vim.fn.jobstart("sed -i '' -e 's/\\[\\[colorscheme .*\\]\\]/[[colorscheme " .. args.match .. "]]/' ~/.config/nvim/lua/ui/theme.lua")
    end,
  })
end

return M
