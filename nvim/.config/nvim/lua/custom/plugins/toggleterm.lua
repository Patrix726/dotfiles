return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<A-t>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
      shade_filetypes = {},
      autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
      size = function(term)
        if term.direction == 'horizontal' then
          return 12
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
    }
  end,
}
