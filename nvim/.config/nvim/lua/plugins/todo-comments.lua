-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  version = '*',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = { signs = false },
  keys = {
    {
      '<leader>st',
      function()
        Snacks.picker.todo_comments()
      end,
      desc = 'Snacks: [S]earch [T]odo comments',
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
