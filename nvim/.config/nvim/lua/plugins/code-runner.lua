return {
  'CRAG666/code_runner.nvim',
  opts = {
    filetype = {
      go = {
        'cd $dir &&',
        'go run $fileName &&',
      },
      dart = {
        'cd $dir &&',
        'dart $fileName &&',
      },
    },
  },
  keys = {
    { '<leader>rr', mode = 'n', '<cmd>RunCode<CR>', noremap = true, silent = false, desc = 'RunCode' },
    { '<leader>rf', mode = 'n', '<cmd>RunFile<CR>', noremap = true, silent = false, desc = 'RunFile' },
    { '<leader>rft', mode = 'n', '<cmd>RunFile tab<CR>', noremap = true, silent = false, desc = 'RunFile tab' },
    { '<leader>rp', mode = 'n', '<cmd>RunProject<CR>', noremap = true, silent = false, desc = 'RunProject' },
    { '<leader>rc', mode = 'n', '<cmd>RunClose<CR>', noremap = true, silent = false, desc = 'RunClose' },
    { '<leader>crf', mode = 'n', '<cmd>CRFiletype<CR>', noremap = true, silent = false, desc = 'CRFiletype' },
    { '<leader>crp', mode = 'n', '<cmd>CRProjects<CR>', noremap = true, silent = false, desc = 'CRProjects' },
  },
}
