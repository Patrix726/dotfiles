return {
  'folke/flash.nvim',
  enabled = true,
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      '<M-s>',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash: Jump',
    },
    {
      '<M-i>',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash: Treesitter',
    },
    {
      '<M-r>',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Flash: Remote',
    },
    {
      '<M-R>',
      mode = { 'o', 'x' },
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Flash: Treesitter Search',
    },
    {
      '<c-s>',
      mode = { 'c' },
      function()
        require('flash').toggle()
      end,
      desc = 'Toggle Flash Search',
    },
  },
}
