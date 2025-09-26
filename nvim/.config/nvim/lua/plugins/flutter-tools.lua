return {
  'nvim-flutter/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    debugger = {
      enabled = true,
    },
    lsp = {
      color = {
        enabled = true,
        background = true,
        virtual_text = false,
      },
    },
  },
  ft = 'dart',
}
