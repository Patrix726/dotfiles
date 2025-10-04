return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'decaycs/decay.nvim',
    name = 'decay',
    lazy = false,
    priority = 1000,
    config = function() end,
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
    config = function() end,
  },
  {
    'Yazeed1s/oh-lucy.nvim',
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = function() end },
  { 'lunarvim/synthwave84.nvim', priority = 1000, config = function() end },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function() end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function() end,
  },
  {
    'nyoom-engineering/oxocarbon.nvim',
    config = function() end,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    },
  },
}
