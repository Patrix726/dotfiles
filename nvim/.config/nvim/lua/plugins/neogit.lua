return {
  'NeogitOrg/neogit',
  keys = {
    { '<leader>gi', mode = 'n', ':Neogit<CR>', noremap = true, desc = 'Neogit dashboard' },
  },
  opts = {
    graph_style = 'kitty',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
}
