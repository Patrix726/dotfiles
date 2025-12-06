return {
  'folke/flash.nvim',
  enabled = true,
  event = 'VeryLazy',
  ---@type Flash.Config
  opts = {
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      '<leader>aj',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash: Jump',
    },
    {
      '<leader>at',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash: Treesitter',
    },
    {
      '<leader>ar',
      mode = 'o',
      function()
        require('flash').remote()
      end,
      desc = 'Flash: Remote',
    },
    {
      '<leader>aT',
      mode = { 'o', 'x' },
      function()
        require('flash').treesitter_search()
      end,
      desc = 'Flash: Treesitter Search',
    },
    {
      '<c-s>',
      mode = { 'c' },
      function()
        require('flash').toggle()
      end,
      desc = 'Toggle Flash Search',
    },
  },
  specs = {
    {
      'folke/snacks.nvim',
      opts = {
        picker = {
          win = {
            input = {
              keys = {
                ['<a-s>'] = { 'flash', mode = { 'n', 'i' } },
                -- ['s'] = { 'flash' },
              },
            },
          },
          actions = {
            flash = function(picker)
              require('flash').jump {
                pattern = '^',
                label = { after = { 0, 0 } },
                search = {
                  mode = 'search',
                  exclude = {
                    function(win)
                      return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= 'snacks_picker_list'
                    end,
                  },
                },
                action = function(match)
                  local idx = picker.list:row2idx(match.pos[1])
                  picker.list:_move(idx, true, true)
                end,
              }
            end,
          },
        },
      },
    },
  },
}
