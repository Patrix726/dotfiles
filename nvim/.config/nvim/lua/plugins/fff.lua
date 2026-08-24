return {
  'dmtrKovalenko/fff',
  build = function()
    require('fff.download').download_or_build_binary()
  end,
  opts = {
    keymaps = {
      close = '<C-c>',
      preview_scroll_up = '<C-b>',
      preview_scroll_down = '<C-f>',
    },
    layout = {
      prompt_position = 'top',
    },
  },
  lazy = false, -- the plugin lazy-initialises itself
  keys = {
    {
      '<leader>sf',
      function()
        require('fff').find_files()
      end,
      desc = 'FFFind files',
    },
    {
      '<leader>sg',
      function()
        require('fff').live_grep()
      end,
      desc = 'LiFFFe grep',
    },
    {
      '<leader>sz',
      function()
        require('fff').live_grep { grep = { modes = { 'fuzzy', 'plain' } } }
      end,
      desc = 'Live fffuzy grep',
    },
    {
      '<leader>sw',
      function()
        require('fff').live_grep_under_cursor()
      end,
      mode = { 'n', 'x' },
      desc = 'Search current word / selection',
    },
  },
}
