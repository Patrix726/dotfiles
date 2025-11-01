-- autocmds
local autocmd = vim.api.nvim_create_autocmd

-- Prefer LSP folding if client supports it
autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method 'textDocument/foldingRange' then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})

autocmd('BufWinEnter', {
  pattern = { '*.md' },
  callback = function()
    vim.opt.textwidth = 80
  end,
})

autocmd({ 'BufWinLeave' }, {
  pattern = { '*.md' },
  callback = function()
    vim.opt.textwidth = 120
  end,
})

-- Restore cursor to file position in previous editing session
autocmd('BufReadPost', {
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd 'normal! g`"zz'
    end
  end,
})

autocmd('FileType', {
  desc = 'Automatically Split help Buffers to the right',
  pattern = 'help',
  command = 'wincmd L',
})

-- Remove the Enter remap in the quickfix window
autocmd('BufReadPost', {
  desc = 'Remap enter to default in quickfix windows',
  group = vim.api.nvim_create_augroup('quickfix-remap', { clear = true }),
  callback = function()
    vim.cmd [[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]]
  end,
})

-- -- Custom Logging macros based on filetype
-- autocmd('FileType', {
--   desc = 'Create a log keybind upon buffer filetype detection',
--   group = vim.api.nvim_create_augroup('LogKeybind', { clear = true }),
--   pattern = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'python' },
--   callback = function()
--     vim.keymap.set('v', '<leader>l', require('configs.macros').log(), { desc = 'Log selected value' })
--   end,
-- })
--
vim.api.nvim_create_user_command('FormatDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = 'Disable autoformat-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('FormatEnable', function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = 'Re-enable autoformat-on-save',
})

vim.api.nvim_create_user_command('ImportSortDisable', function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autosort = true
  else
    vim.g.disable_autosort = true
  end
end, {
  desc = 'Disable autoimportsorting-on-save',
  bang = true,
})

vim.api.nvim_create_user_command('ImportSortEnable', function()
  vim.b.disable_autosort = false
  vim.g.disable_autosort = false
end, {
  desc = 'Re-enable autoimportsorting-on-save',
})

-- Stop Neovim Daemons.
autocmd('ExitPre', {
  group = vim.api.nvim_create_augroup('StopNeovimDaemons', { clear = true }),
  desc = 'Stop Neovim Dameons (eslint_d, prettier_d etc.) upon exit',
  callback = function()
    vim.fn.jobstart(vim.fn.expand '$SCRIPTS' .. 'stop-nvim-daemons.sh', { detach = true })
  end,
})

-- vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI', 'BufEnter' }, {
--   group = vim.api.nvim_create_augroup('ScrollOffEOF', {}),
--   callback = function()
--     local win_h = vim.api.nvim_win_get_height(0)
--     local off = math.min(vim.o.scrolloff, math.floor(win_h / 2))
--     local dist = vim.fn.line '$' - vim.fn.line '.'
--     local rem = vim.fn.line 'w$' - vim.fn.line 'w0' + 1
--     if dist < off and win_h - rem + dist < off then
--       local view = vim.fn.winsaveview()
--       view.topline = view.topline + off - (win_h - rem + dist)
--       vim.fn.winrestview(view)
--     end
--   end,
-- })
