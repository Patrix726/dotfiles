return {
  '2kabhishek/seeker.nvim',
  dependencies = { 'folke/snacks.nvim' },
  cmd = { 'Seeker' },
  keys = {
    { '<leader>sf', '<cmd>Seeker files<CR>', desc = 'Seek Files' },
    { '<leader>sg', '<cmd>Seeker grep<CR>', desc = 'Seek Grep' },
    { '<leader>sw', '<cmd>Seeker grep_word<CR>', desc = 'Seek Grep Word' },
    -- { '<leader>ff', '<cmd>Seeker git_files<CR>', desc = 'Seek Git Files' },
  },
  opts = {}, -- Required unless you call seeker.setup() manually, add your configs here
}
