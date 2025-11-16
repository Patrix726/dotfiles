return {
  'MagicDuck/grug-far.nvim',
  enabled = false,
  opts = {},
  cmd = 'GrugFar',
  keys = {
    {
      mode = { 'n', 'x' },
      '<leader>si',
      function()
        require('grug-far').open { visualSelectionUsage = 'operate-within-range' }
      end,
      desc = 'Grug-Far: Search and Replace within range',
    },
  },
}
