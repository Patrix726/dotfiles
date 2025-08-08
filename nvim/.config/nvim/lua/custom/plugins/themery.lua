return {
  'zaldih/themery.nvim',
  lazy = false,
  config = function()
    -- Minimal config
    require('themery').setup {
      -- themes = { 'tokyonight-night' , 'tokyonight-moon', 'tokyonight-storm', 'tokyonight-day', 'tokyonight', 'torte'}, -- Your list of installed colorscheme
      themes = vim.fn.getcompletion('', 'color'),
      livePreview = true, -- Apply theme while picking. Default to true.
    }
  end,
}
