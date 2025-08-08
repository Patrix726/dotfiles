return {
  'nguyenvukhang/nvim-toggler', -- init.lua
  config = function()
    require('nvim-toggler').setup {
      -- your own inverses
      inverses = {
        ['!=='] = '===',
      },
      -- removes the default <leader>i keymap
      remove_default_keybinds = true,
      --
      -- auto-selects the longest match when there are multiple matches
      autoselect_longest_match = false,
      -- removes the default set of inverses
      -- remove_default_inverses = true,
    }
  end,
}
