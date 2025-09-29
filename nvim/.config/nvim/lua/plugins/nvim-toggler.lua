return {
  'nguyenvukhang/nvim-toggler', -- init.lua
  opts = {
    -- your own inverses
    inverses = {
      ['!=='] = '===',
      ['dark'] = 'light',
    },
    -- removes the default <leader>i keymap
    remove_default_keybinds = true,
    --
    -- auto-selects the longest match when there are multiple matches
    autoselect_longest_match = false,
    -- removes the default set of inverses
    -- remove_default_inverses = true,
  },
  keys = {
    {
      '<leader>tv',
      mode = { 'n', 'v' },
      function()
        require('nvim-toggler').toggle()
      end,
      desc = 'Toggle value',
    },
  },
}
