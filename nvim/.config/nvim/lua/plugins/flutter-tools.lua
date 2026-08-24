return {
  'nvim-flutter/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  ft = 'dart',
  opts = {
    debugger = {
      enabled = false,
    },
    lsp = {
      color = {
        enabled = true,
        background = true,
        virtual_text = false,
      },
    },
  },
  config = function(_, opts)
    require('flutter-tools').setup(opts)
    local keymaps = {
      { 'fR', 'FlutterRestart', 'Restart' },
      { 'fr', 'FlutterReload', 'Reload' },
      { 'fq', 'FlutterQuit', 'Quit' },
      { 'ft', 'FlutterLogToggle', 'Log Toggle' },
      { 'fl', 'FlutterLspRestart', 'Lsp Restart' },
      { 'fd', 'FlutterDevices', 'Devices' },
    }
    local function set_flutter_keymaps(bufnr)
      for _, km in ipairs(keymaps) do
        vim.keymap.set('n', '<leader>' .. km[1], '<cmd>' .. km[2] .. '<cr>', { buffer = bufnr, desc = 'Flutter: ' .. km[3] })
      end
    end
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'dart',
      callback = function()
        set_flutter_keymaps(0)
      end,
    })
    if vim.bo.filetype == 'dart' then
      set_flutter_keymaps(0)
    end
  end,
}
