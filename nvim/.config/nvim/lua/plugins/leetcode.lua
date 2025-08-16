return {
  'kawre/leetcode.nvim',
  build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
  dependencies = {
    -- include a picker of your choice, see picker section for more details
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    ---@type lc.lang
    lang = 'python3',

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
  cmd = 'Leet',
  keys = {
    { '<leader>lc', mode = 'n', '<cmd>Leet<CR>', desc = 'Open Leetcode dashboard' },
    { '<leader>lr', mode = 'n', '<cmd>Leet run<CR>', desc = 'Run code attempt' },
    { '<leader>ls', mode = 'n', '<cmd>Leet submit<CR>', desc = 'Submit code attempt' },
    { '<leader>ln', mode = 'n', '<cmd>Leet console<CR>', desc = 'Open leetcode console' },
    { '<leader>li', mode = 'n', '<cmd>Leet info<CR>', desc = 'Open info menu for current problem' },
    { '<leader>ll', mode = 'n', '<cmd>Leet lang<CR>', desc = 'Open language menu' },
    { '<leader>ly', mode = 'n', '<cmd>Leet yank<CR>', desc = 'Copy the attempted code solution' },
    { '<leader>ld', mode = 'n', '<cmd>Leet desc<CR>', desc = 'Toggle question description' },
    { '<leader>lxe', mode = 'n', '<cmd>Leet random difficulty=easy<CR>', desc = 'Open a random easy problem' },
    { '<leader>lxm', mode = 'n', '<cmd>Leet random difficulty=medium<CR>', desc = 'Open a random medium problem' },
    { '<leader>lxh', mode = 'n', '<cmd>Leet random difficulty=hard<CR>', desc = 'Open a random hard problem' },
    {
      '<leader>lg',
      mode = 'n',
      function()
        local lc = require 'configs.leetcode'
        lc.move_and_git_commit()
      end,
      desc = 'Move the submitted code to solved list and git commit',
    },
  },
}
