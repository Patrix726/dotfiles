return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {},
  keys = {
    {
      '<leader>osS',
      function()
        require('persistence').load()
      end,
      mode = 'n',
      desc = 'Load the session for the current directory',
    },
    {
      '<leader>oss',
      function()
        require('persistence').select()
      end,
      mode = 'n',
      desc = 'Select a session to load',
    },
    {
      '<leader>osl',
      function()
        require('persistence').load { last = true }
      end,
      mode = 'n',
      desc = 'Load the last session',
    },
    {
      '<leader>osd',
      function()
        require('persistence').stop()
      end,
      mode = 'n',
      desc = "Stop persistence session | Won't be saved on exit",
    },
  },
}
