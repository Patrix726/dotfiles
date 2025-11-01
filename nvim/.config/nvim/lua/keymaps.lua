---@module "snacks"

-- [[ Basic Keymaps ]]
local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open file diagnostic [Q]uickfix list' })
map('n', '<leader>dQ', vim.diagnostic.setqflist, { desc = 'Open Workspace diagnostic [Q]uickfix list' })
map('n', '<leader>q', function()
  require('configs.qf').toggle_qf 'q'
end, { desc = 'Toggle [Q]uickfix list' })
map('n', '<leader>_', function()
  require('configs.qf').toggle_qf 'l'
end, { desc = 'Toggle [L]ocation list' })

-- New file using snacks picker keymaps
-- map('n', '<leader>cp', require('configs.new-file').create_path_in_folder, { desc = '[C]reate new file/folder/[P]ath in selected directory' })

map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('t', '<C-h>', '<cmd>wincmd h<cr>', { desc = 'Move focus to the left window in terminal mode' })
map('t', '<S-C-l>', '<cmd>wincmd l<cr>', { desc = 'Move focus to the right window in terminal mode' })
map('t', '<C-j>', '<cmd>wincmd j<cr>', { desc = 'Move focus to the lower window in terminal mode' })
map('t', '<C-k>', '<cmd>wincmd k<cr>', { desc = 'Move focus to the upper window in terminal mode' })
map('t', '<C-w>', '<C-\\><C-n><C-w>', { desc = 'Control current window in terminal mode' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
map('n', '<M-S-h>', '<C-w>H', { desc = 'Move window to the left' })
map('n', '<M-S-l>', '<C-w>L', { desc = 'Move window to the right' })
map('n', '<M-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
map('n', '<M-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- Search and replace
map('n', '<leader>ra', function()
  local search_term = vim.fn.getreg '/'
  Snacks.input({ prompt = "Replace '" .. search_term .. "' with: " }, function(replace_term)
    vim.cmd(':%s/' .. search_term .. '/' .. replace_term .. '/g')
  end)
end, { desc = 'Substitute last searched word with input' })

map('n', '<leader>rs', function()
  local search_term = vim.fn.getreg '/'
  Snacks.input({ prompt = "Replace '" .. search_term .. "' with: " }, function(replace_term)
    vim.cmd(':%s/' .. search_term .. '/' .. replace_term .. '/gc')
  end)
end, { desc = 'Substitute last searched word with input with confirmation' })

map('n', '<leader>tt', require('configs.bufferline').toggle_bufferline, { desc = 'Toggle bufferline' })
map('n', '<leader>tc', '<cmd>TSContext toggle<cr>', { desc = 'Toggle treesitter context' })
map('n', '<M-n>', function()
  Snacks.notifier.show_history()
end, { desc = 'Show snacks notification history' })
map('n', '<leader>tF', function()
  if vim.g.disable_autosort then
    vim.cmd ':ImportSortEnable'
    Snacks.notify.info 'Auto import sorting enabled'
  else
    vim.cmd ':ImportSortDisable'
    Snacks.notify.info 'Auto import sorting disabled'
  end
end, { desc = 'Toggle auto import sorting on save' })
map('n', '<leader>tf', function()
  if vim.g.disable_autoformat then
    vim.cmd ':FormatEnable'
    Snacks.notify.info 'Auto formatting enabled'
  else
    vim.cmd ':FormatDisable'
    Snacks.notify.info 'Auto formatting disabled'
  end
end, { desc = 'Toggle auto format on save' })
map({ 'n', 'v' }, ';', ':', { desc = 'CMD enter command mode' })
map({ 'n', 'v' }, ',', ';', { desc = 'Repeat last f or t command' })
map({ 'n', 'v' }, ':', ',', { desc = 'Execute the inverse of the last f or t command' })
map('n', 'ycc', 'yygccp', { remap = true, desc = 'Duplicate line and comment out original' })
map({ 'n', 'v', 'o' }, 'H', '^', { desc = 'Go to the beginning of the line' })
map({ 'n', 'v', 'o' }, 'L', '$', { desc = 'Go to the end of the line' })
map('n', '<CR>', 'm`o<Esc>``', { desc = 'Insert new line below in normal mode' })
map('n', '<S-CR>', 'm`O<Esc>``', { desc = 'Insert new line above in normal mode' })
map('v', '<leader>p', '"_dP', { desc = 'Paste previous to cursor and keep the paste value' })
map('v', '<leader>P', '"_dp', { desc = 'Paste next to cursor and keep the paste value' })
map('n', 'U', '<C-r>', { desc = 'Redo key' })
map('i', 'jk', '<ESC>')
map({ 'n', 'v' }, '`', 'q', { desc = 'Start macro recording' })
map({ 'n', 'v' }, 'q', 'b', { desc = 'One word back' })
map({ 'n', 'v' }, 'b', '%', { desc = 'Complimenting bracket' })
map('n', '<C-S>', ':w<CR>', { desc = 'Save file' })
map('n', '<leader>wk', ':WhichKey<CR>', { desc = 'Open WhichKey dialog' })
map('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })
map('x', '/', '<Esc>/\\%V', { desc = 'Search within visually selected lines' })
-- map('n', '<leader>trn', '<cmd>set rnu!<CR>', { desc = 'Toggle relative number' })
map('n', 'x', '"_x', { desc = 'Remap x to use the _ register' })
map({ 'n', 'v' }, '+', '<C-a>', { desc = 'Increment value' })
map({ 'n', 'v' }, '-', '<C-x>', { desc = 'Decrement value' })
map({ 'n', 'v' }, 'g+', 'g<C-a>', { desc = 'Context aware increment value' })
map({ 'n', 'v' }, 'g-', 'g<C-x>', { desc = 'Context aware decrement value' })
map('n', '<C-a>', 'gg<S-v>G', { desc = 'Select entire file' })
map('n', '<leader>gp', '`[v`]', { desc = 'Select pasted text' })
map('n', '[/', '[<c-i>', { desc = 'Get first occurence of word' })
map('n', '<leader>hP', '<cmd>Gitsigns preview_hunk_inline<cr>', { desc = 'Toggle gitsigns hunk inline preview' })

-- Go to next and previous error
map('n', ']e', function()
  vim.diagnostic.jump { severity = vim.diagnostic.severity.ERROR, wrap = true, float = true, count = 1 }
end, { desc = 'Error forward' })
map('n', '[e', function()
  vim.diagnostic.jump { severity = vim.diagnostic.severity.ERROR, wrap = true, float = true, count = -1 }
end, { desc = 'Error backward' })

-- Navigate to and from quotation marks of all kinds
map({ 'n', 'o', 'x' }, "]'", [[/\v("|'|`)[^"'`]*\1<CR><cmd>nohlsearch<CR>]], { desc = 'Jump forwards to the next pair of quotes' })
map({ 'n', 'o', 'x' }, "['", [[?\v("|'|`)[^"'`]*\1<CR><cmd>nohlsearch<CR>]], { desc = 'Jump backwards to the previous pair of quotes' })
map({ 'n', 'o', 'x' }, ']"', [[/\v("|'|`)[^"'`]*\zs\1<CR><cmd>nohlsearch<CR>]], { desc = 'Jump forwards to the next closing quote (", \', `)' })
map({ 'n', 'o', 'x' }, '["', [[?\v("|'|`)[^"'`]*\zs\1<CR><cmd>nohlsearch<CR>]], { desc = 'Jump backwards to the previous closing quote (", \', `)' })

-- Navigate Open Buffers
map('n', '<leader>x', '<cmd>bp<CR><cmd>bd#<CR>', { desc = 'buffer close' })
map('n', '<tab>', ':bn<CR>', { desc = 'buffer goto next' })
map('n', '<S-tab>', ':bp<CR>', { desc = 'buffer goto previous' })

-- Navigate Open Tabs
map('n', '<C-z>', ':tabclose<CR>', { desc = 'Tab close' })
map('n', '<C-n>', ':tabnew<CR>', { desc = 'Tab create' })
map('n', '<S-C-j>', ':tabnext<CR>', { desc = 'Tab goto next' })
map('n', '<S-C-k>', ':tabprevious<CR>', { desc = 'Tab goto previous' })

-- Persistence Keybinds
map('n', '<leader>osS', require('persistence').load, { desc = 'Load the session for the current directory' })
map('n', '<leader>oss', require('persistence').select, { desc = 'Select a session to load' })
map('n', '<leader>osl', function()
  require('persistence').load { last = true }
end, { desc = 'Load the last session' })
map('n', '<leader>osd', require('persistence').stop, { desc = "Stop persistence session | Won't be saved on exit" })

-- Snacks scratch keymaps
map('n', '<leader>ts', require('snacks').scratch.open, { desc = 'Toggle scratch buffer instance' })
map('n', '<leader>sS', require('snacks').scratch.select, { desc = 'Snacks: Select from scranch instances' })

-- Lens line keymaps
map('n', '\\g', '<cmd>LenslineToggle<cr>', { desc = 'Toggle lens line' })
-- Repeat last move from treesitter textobjects

-- local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'
-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
-- map({ "n", "x", "o" }, ":", ts_repeat_move.repeat_last_move_next)
-- map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- map({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move, { desc = 'Next textobject forward' })
-- map({ 'n', 'x', 'o' }, ':', ts_repeat_move.repeat_last_move_opposite, { desc = 'Next textobject opposite' })

-- map({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr, { expr = true })
-- map({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr, { expr = true })
-- map({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr, { expr = true })
-- map({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr, { expr = true })
