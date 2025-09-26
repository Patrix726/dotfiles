-- Unlink current snippet on leaving insert/select mode
-- https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1011938524
vim.api.nvim_create_autocmd('ModeChanged', {
  desc = 'Unlink current snippet on leaving insert/selection mode.',
  group = vim.api.nvim_create_augroup('LuaSnipModeChanged', {}),
  pattern = '[si]*:[^si]*',
  -- Blink.cmp will enter normal mode shortly on accepting snippet completion,
  -- see https://github.com/Saghen/blink.cmp/issues/2035
  -- We don't want to unlink the current snippet in that case, as a workaround
  -- wait a short time after leaving insert/select mode and unlink current
  -- snippet if still not inside insert/select mode
  callback = vim.schedule_wrap(function(args)
    local ls = require 'luasnip'

    if vim.fn.mode():match '^[si]' then -- still in insert/select mode
      return
    end
    if ls.session.current_nodes[args.buf] and not ls.session.jump_active then
      ls.unlink_current()
    end
  end),
})
