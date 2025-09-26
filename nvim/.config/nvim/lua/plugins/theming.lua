return {
  -- {
  --   dir = vim.fn.stdpath 'data' .. '/lazy/chameleon.nvim',
  --   lazy = false,
  --   enabled = false,
  --   -- priority = 900,
  --   config = function()
  --     require('chameleon').setup {
  --
  --       hyde = false,
  --     }
  --   end,
  --   dependencies = {
  --     'folke/snacks.nvim',
  --     'nvim-lua/plenary.nvim',
  --   },
  -- },
  {
    dir = vim.fn.stdpath 'config' .. '/lua/ui',
    lazy = false,
    priority = 900,
    config = function()
      require('ui').setup()
    end,
  },
}
