return {
  'Bekaboo/dropbar.nvim',
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  event = 'BufWinEnter',
  opts = {
    bar = {
      enable = function(buf, win, _)
        if
          not vim.api.nvim_buf_is_valid(buf)
          or not vim.api.nvim_win_is_valid(win)
          or vim.fn.win_gettype(win) ~= ''
          or vim.wo[win].winbar ~= ''
          or vim.bo[buf].ft == 'help'
          or vim.bo[buf].buftype == 'terminal'
        then
          return false
        end

        local stat = vim.uv.fs_stat(vim.api.nvim_buf_get_name(buf))
        if stat and stat.size > 1024 * 1024 then
          return false
        end

        return vim.bo[buf].ft == 'markdown'
          or pcall(vim.treesitter.get_parser, buf)
          or not vim.tbl_isempty(vim.lsp.get_clients {
            bufnr = buf,
            method = vim.lsp.protocol.Methods.textDocument_documentSymbol,
          })
      end,
    },
  },
  keys = {
    {
      '<leader>;',
      mode = 'n',
      function()
        require('dropbar.api').pick()
      end,
      desc = 'Pick symbols in winbar',
    },
    {
      '[;',
      mode = 'n',
      function()
        require('dropbar.api').goto_context_start()
      end,
      desc = 'Go to start of current context',
    },
    {
      '];',
      mode = 'n',
      function()
        require('dropbar.api').select_next_context()
      end,
      desc = 'Select next context',
    },
  },
}
