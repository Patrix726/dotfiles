return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'decaycs/decay.nvim',
    name = 'decay',
    lazy = false,
    priority = 1000,
    config = function()
      -- SNIP
    end,
  },
  {
    'navarasu/onedark.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function() end,
  },
  {
    'projekt0n/github-nvim-theme',
    event = 'VeryLazy',
    priority = 1000,
    config = function() end,
  },
  {
    'stevedylandev/ansi-nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd 'colorscheme ansi'
      -- vim.opt.termguicolors = false
    end,
  },
}
