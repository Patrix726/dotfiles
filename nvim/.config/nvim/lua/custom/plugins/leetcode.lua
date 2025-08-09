return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    -- configuration goes here

    ---@type lc.lang
    lang = 'python3',
    ---
    ---@type lc.storage
    storage = {
      home = '$HOME/Documents/Code/CPD' .. '/Leetcode/attempt',
      cache = vim.fn.stdpath 'cache' .. '/leetcode',
    },
    editor = {
      reset_previous_code = true,
      fold_imports = true,
    },
  },
}
