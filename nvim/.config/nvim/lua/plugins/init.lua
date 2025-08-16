-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'NMAC427/guess-indent.nvim', opts = {} },
  {
    'NeogitOrg/neogit',
    keys = {
      { '<leader>gi', mode = 'n', ':Neogit<CR>', noremap = true, desc = 'Open Neogit dashboard' },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
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
  { 'godlygeek/tabular', cmd = 'Tabularize' },
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
}
