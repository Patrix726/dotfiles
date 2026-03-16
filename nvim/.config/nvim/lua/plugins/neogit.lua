return {
  'NeogitOrg/neogit',
  keys = {
    { '<leader>gi', mode = 'n', ':Neogit<CR>', noremap = true, desc = 'Neogit dashboard' },
  },
  opts = {
    graph_style = 'kitty',
    diff_viewer = 'codediff',
    signs = {
      item = { '', '' },
      section = { '', '' },
    },
    integrations = {
      telescope = false,
      snacks = true,
      codediff = true,
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
}
