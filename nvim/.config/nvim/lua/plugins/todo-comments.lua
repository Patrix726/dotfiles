-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
  keys = {
    {
      mode = { 'n' },
      '<leader>st',
      '<cmd>TodoTelescope<cr>',
      desc = 'TODO: Search for TODO Comments',
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
