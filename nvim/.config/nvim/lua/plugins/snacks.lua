---@module "snacks"
return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    ---@type table<string, snacks.win.Config>
    styles = {

      scratch = {
        width = 120,
        height = 30,
        bo = { buftype = '', buflisted = false, bufhidden = 'hide', swapfile = false },
        minimal = false,
        noautocmd = false,
        -- position = "right",
        zindex = 20,
        wo = { winhighlight = 'NormalFloat:Normal' },
        border = 'rounded',
        title_pos = 'center',
        footer_pos = 'center',
      },
    },

    ---@class snacks.dashboard.Config
    ---@field enabled? boolean
    ---@field sections snacks.dashboard.Section
    ---@field formats table<string, snacks.dashboard.Text|fun(item:snacks.dashboard.Item, ctx:snacks.dashboard.Format.ctx):snacks.dashboard.Text>
    dashboard = {
      preset = {
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = ' ', key = 'f', desc = 'Find File', action = ":lua Snacks.dashboard.pick('files')" },
          -- { icon = ' ', key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = ' ', key = 'g', desc = 'Find Text', action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'l', desc = 'Leetcode Dashboard', action = ':Leet' },
          { icon = ' ', key = 'c', desc = 'Config', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = '󰦛 ', key = 's', desc = 'Restore Session', section = 'session' },
          {
            icon = '󰦛 ',
            key = 'S',
            desc = 'Restore Last Session',
            action = function()
              require('persistence').load { last = true }
            end,
          },
          { icon = '󰒲 ', key = 'L', desc = 'Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Quit', action = ':qa' },
        },
      },
    },

    notifier = {},
    indent = {},
    scratch = {
      ft = function()
        if vim.bo.buftype == '' and vim.bo.filetype == 'lua' and vim.bo.filetype == 'python' and vim.bo.filetype == 'javascript' then
          return vim.bo.filetype
        end
        return 'markdown'
      end,
      filekey = {
        cwd = true,
        branch = false,
        count = false,
      },
      win_by_ft = {
        lua = {
          keys = {
            ['source'] = {
              '<cr>',
              function(self)
                local name = 'scratch.' .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ':e')
                Snacks.debug.run { buf = self.buf, name = name }
              end,
              desc = 'Source buffer',
              mode = { 'n', 'x' },
            },
          },
        },
      },
    },
    input = {},
    bigfile = {
      notify = true, -- show notification when big file detected
      size = 1.5 * 1024 * 1024, -- 1.5MB
      line_length = 500, -- average line length (useful for minified files)
      -- Enable or disable features when big file detected
      ---@param ctx {buf: number, ft:string}
      setup = function(ctx)
        if vim.fn.exists ':NoMatchParen' ~= 0 then
          vim.cmd [[NoMatchParen]]
        end
        Snacks.util.wo(0, { foldmethod = 'manual', statuscolumn = '', conceallevel = 0 })
        vim.b.minianimate_disable = true
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(ctx.buf) then
            vim.bo[ctx.buf].syntax = ctx.ft
          end
        end)
      end,
    },
    statuscolumn = {
      left = { 'mark', 'sign', 'git' }, -- priority of signs on the left (high to low)
      right = { 'fold' }, -- priority of signs on the right (high to low)
      folds = {
        open = true, -- show open fold icons
        git_hl = false, -- use Git Signs hl for fold icons
      },
      git = {
        -- patterns to match Git signs
        patterns = { 'GitSign', 'MiniDiffSign' },
      },
      refresh = 50, -- refresh at most every 50ms
    },
  },
  keys = {
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = 'Git Log',
    },
    {
      '<leader>gb',
      function()
        Snacks.git.blame_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>gf',
      function()
        Snacks.picker.git_log_file()
      end,
      desc = 'Git Log File',
    },
    {
      '<leader>bd',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete Buffer',
    },
    {
      '<leader>bo',
      function()
        Snacks.bufdelete.other()
      end,
      desc = 'Delete Other Buffers',
    },
  },
}
