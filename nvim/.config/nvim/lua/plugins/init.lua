-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'NMAC427/guess-indent.nvim', opts = {} },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown', 'Avante' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = { blink = { enabled = true } },
      file_types = { 'markdown', 'Avante' },
    },
  },
  {
    'chentoast/marks.nvim',
    event = 'BufReadPost',
    opts = {},
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'ThePrimeagen/vim-be-good',
    cmd = 'VimBeGood',
  },
  {
    'godlygeek/tabular',
    cmd = 'Tabularize',
    keys = {
      { '<leader>cf', mode = { 'n', 'v' }, '<cmd>Tabularize multiple_spaces<CR>', desc = 'Tabularize paragraph into columns based on multiple space' },
    },
  },
  { 'dmmulroy/ts-error-translator.nvim', opts = {}, ft = { 'typescript', 'typescriptreact' } },
  {
    'unblevable/quick-scope',
    init = function()
      require 'configs.quick-scope'
    end,
    config = function() end,
  },
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {},
  },
  {
    'vuciv/golf',
    cmd = 'Golf',
    keys = {
      { '<leader>oge', mode = { 'n' }, '<cmd>Golf easy<CR>', desc = 'Golf: Open an easy problem' },
      { '<leader>ogm', mode = { 'n' }, '<cmd>Golf medium<CR>', desc = 'Golf: Open a medium problem' },
      { '<leader>ogh', mode = { 'n' }, '<cmd>Golf hard<CR>', desc = 'Golf: Open a hard problem' },
      { '<leader>ogt', mode = { 'n' }, '<cmd>Golf today<CR>', desc = "Golf: Open today's problem" },
    },
  },
}
