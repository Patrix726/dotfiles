return {
  'nvim-treesitter/nvim-treesitter-context',
  enabled = true,
  opts = {
    enable = false,
    max_lines = 3,
  },
  keys = {
    { '<leader>tc', '<cmd>TSContext toggle<cr>', mode = 'n', desc = 'Toggle treesitter context' },
  },
}
