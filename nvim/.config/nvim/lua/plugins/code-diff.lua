return {
  'esmuellert/codediff.nvim',
  dependencies = { 'MunifTanjim/nui.nvim' },
  cmd = 'CodeDiff',
  opts = {
    explorer = {
      width = 30,
    },
  },
  keys = {
    {
      '<leader>gd',
      '<cmd>CodeDiff<cr>',
      desc = 'Git Diff',
    },
  },
}
