return {
  'leath-dub/snipe.nvim',
  keys = {
    {
      'gb',
      function()
        require('snipe').open_buffer_menu()
      end,
      desc = 'Open Snipe buffer menu',
    },
  },
  opts = {
    ui = {
      preselect_current = true,
    },
    navigate = {
      cancel_snipe = 'q',
    },

    -- preselect = function()
    --   require('snipe').preselect_by_classifier '#'
    -- end,
  },
}
