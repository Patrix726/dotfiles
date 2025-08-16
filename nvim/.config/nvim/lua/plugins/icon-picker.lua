return {
  'ziontee113/icon-picker.nvim',
  opts = { disable_legacy_commands = true },
  keys = {
    {
      '<leader><leader>i',
      mode = 'n',
      '<cmd>IconPickerNormal<cr>',
      desc = 'Pick icons and insert',
    },
    {
      '<leader><leader>y',
      mode = 'n',
      '<cmd>IconPickerYank<cr>',
      desc = 'Pick icons and yank',
    },
  },
}
