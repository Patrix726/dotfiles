return {
  'dmmulroy/tsc.nvim',
  opts = {},
  cmd = 'TSC',
  keys = {
    {
      '<leader>ce',
      mode = 'n',
      '<cmd>TSC<cr>',
      desc = 'Check for Type Errors',
    },
  },
}
