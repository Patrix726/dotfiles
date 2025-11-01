return {
  'stevearc/aerial.nvim',
  enabled = true,
  opts = {
    close_automatic_events = {
      'unfocus',
      'switch_buffer',
    },
    guides = {
      nested_top = ' │ ',
      mid_item = ' ├─',
      last_item = ' └─',
      whitespace = '   ',
    },
    layout = {
      placement = 'window',
      close_on_select = false,
      max_width = 30,
      min_width = 30,
    },
    ignore = {
      buftypes = {},
    },
    -- icons = tools.ui.kind_icons,
    show_guides = true,
    -- open_automatic = function()
    --   local aerial = require 'aerial'
    --   return vim.api.nvim_win_get_width(0) > 80 and not aerial.was_closed()
    -- end,
  },
  keys = {
    { '<leader>ta', mode = 'n', '<cmd>AerialToggle<cr>', desc = 'Toggle aerial volume' },
    { 'ga', mode = 'n', '<cmd>AerialGo<cr>', desc = 'Go to root symbol' },
    {
      '[;',
      mode = { 'v', 'o', 'n' },
      function()
        local count = vim.v.count
        if count < 1 then
          count = 1
        end
        return '<cmd>' .. count .. 'AerialPrev<cr>'
      end,
      desc = 'Select prev context',
      expr = true,
    },
    {
      '];',
      mode = { 'v', 'o', 'n' },
      function()
        local count = vim.v.count
        if count < 1 then
          count = 1
        end
        return '<cmd>' .. count .. 'AerialNext<cr>'
      end,
      desc = 'Select next context',
      expr = true,
    },
  },
}
