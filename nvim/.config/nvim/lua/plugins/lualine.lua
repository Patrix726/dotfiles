return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    options = {
      theme = 'auto',
      component_separators = '',
      -- section_separators = { left = ' ', right = ' ' },
      disabled_filetypes = {
        'alpha',
        'Outline',
        'dapui_watches',
        'dapui_breakpoints',
        'dapui_scopes',
        'dapui_console',
        'dapui_stacks',
        'dap-repl',
      },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '', right = '' }, icon = '', padding = { left = 1, right = 1 } },
      },
      lualine_b = {},
      lualine_c = {
        {
          'branch',
          icon = '',
        },
        {
          'diff',
          symbols = { added = ' ', modified = ' ', removed = ' ' },
          colored = false,
        },
      },
      lualine_x = {
        {
          'diagnostics',
          symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          update_in_insert = true,
        },
      },
      lualine_y = {
        {
          'filetype',
          icon_only = true,
          padding = { left = 1, right = 0 },
        },
        'filename',
      },
      lualine_z = {
        { 'location', separator = { left = '', right = '' } },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { 'location' },
    },
    extensions = { 'toggleterm', 'trouble', 'quickfix', 'aerial', 'nvim-dap-ui' },
  },
}
