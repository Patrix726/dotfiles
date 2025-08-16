return {
  'Wansmer/treesj',
  -- event = 'BufEnter',
  keys = {
    {
      '<leader>j',
      mode = 'n',
      function()
        require('treesj').toggle()
      end,
      desc = 'Toggle between inline and multiline callback format',
    },
  },
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  opts = { use_default_keymaps = false },
}
