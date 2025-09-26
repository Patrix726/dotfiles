return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {
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
  },
  keys = {
    { '<A-t>', mode = { 'n', 't' }, '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Toggle horizontal terminal' },
    { '<A-v>', mode = { 'n', 't' }, '<cmd>ToggleTerm direction=vertical<cr>', desc = 'Toggle vertical terminal' },
    { '<A-f>', mode = { 'n', 't' }, '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle float terminal' },
  },
}
