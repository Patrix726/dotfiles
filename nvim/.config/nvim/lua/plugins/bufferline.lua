return {
  'akinsho/bufferline.nvim',
  event = 'BufEnter',
  enabled = true,
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require 'bufferline'
    bufferline.setup {
      options = {
        indicator = {
          style = 'underline',
        },
        diagnostics = 'nvim_lsp',
        show_buffer_close_icons = false,
        style_preset = bufferline.style_preset.no_italic,
        always_show_bufferline = false,
      },
    }
  end,
}
