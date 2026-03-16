return {
  'serhez/bento.nvim',
  event = 'BufReadPost',
  opts = {
    main_keymap = '<C-;>',
    map_last_accessed = true,
    max_open_buffers = 10,
    ui = {
      floating = {
        position = 'top-right',
        offset_y = 2,
        minimal_menu = 'dashed',
      },
    },
  },
}
