-- [[ Basic Keymaps ]]
local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '<leader>d', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>q', function()
  require('configs.qf').toggle_qf 'q'
end, { desc = 'Toggle [Q]uickfix list' })
map('n', '<leader>l', function()
  require('configs.qf').toggle_qf 'l'
end, { desc = 'Toggle [L]ocation list' })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('t', '<C-h>', '<cmd>wincmd h<cr>', { desc = 'Move focus to the left window in terminal mode' })
map('t', '<S-C-l>', '<cmd>wincmd l<cr>', { desc = 'Move focus to the right window in terminal mode' })
map('t', '<C-j>', '<cmd>wincmd j<cr>', { desc = 'Move focus to the lower window in terminal mode' })
map('t', '<C-k>', '<cmd>wincmd k<cr>', { desc = 'Move focus to the upper window in terminal mode' })
map('t', '<C-w>', '<C-\\><C-n><C-w>', { desc = 'Control current window in terminal mode' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
map('n', '<C-S-h>', '<C-w>H', { desc = 'Move window to the left' })
map('n', '<C-S-l>', '<C-w>L', { desc = 'Move window to the right' })
map('n', '<C-S-j>', '<C-w>J', { desc = 'Move window to the lower' })
map('n', '<C-S-k>', '<C-w>K', { desc = 'Move window to the upper' })

-- Remove the Enter remap in the quickfix window
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Remap enter to default in quickfix windows',
  group = vim.api.nvim_create_augroup('quickfix-remap', { clear = true }),
  callback = function()
    vim.cmd [[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]]
  end,
})

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

map('n', ';', ':', { desc = 'CMD enter command mode' })
map({ 'n' }, ',', ';', { desc = 'Repeat last f or t command' })
map({ 'n' }, ':', ',', { desc = 'Execute the inverse of the last f or t command' })
map('n', 'ycc', 'yygccp', { remap = true, desc = 'Duplicate line and comment out original' })
map({ 'n', 'v' }, 'H', '^', { desc = 'Go to the beginning of the line' })
map({ 'n', 'v' }, 'L', '$', { desc = 'Go to the end of the line' })
map('n', 'dH', 'd^', { desc = 'Delete upto beginning of line' })
map('n', 'dL', 'd$', { desc = 'Delete upto end of line' })
map('n', 'cH', 'c^', { desc = 'Cut upto beginning of line' })
map('n', 'cL', 'c$', { desc = 'Cut upto end of line' })
map('n', '<CR>', 'm`o<Esc>``', { desc = 'Insert new line below in normal mode' })
map('n', '<S-CR>', 'm`O<Esc>``', { desc = 'Insert new line above in normal mode' })
map('n', '<A-j>', ':m .+1<cr>==', { desc = 'Move current line to below' })
map('n', '<A-k>', ':m .-2<cr>==', { desc = 'Move current line to above' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines to below' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines to above' })
map('v', '<leader>p', '"_dP', { desc = 'Paste onto selected line and keep the paste value' })
map('n', 'U', '<C-r>', { desc = 'Redo key' })
map('i', 'jk', '<ESC>')
map('n', '`', 'q', { desc = 'Start macro recording' })
map('n', 'q', 'b', { desc = 'One word back' })
map('n', 'b', '%', { desc = 'Complimenting bracket' })
map('n', '<C-S>', ':w<CR>', { desc = 'Save file' })
map('n', '<leader>wk', ':WhichKey<CR>', { desc = 'Open WhichKey dialog' })
map('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })
map('x', '/', '<Esc>/\\%V', { desc = 'Search within visually selected lines' })
map('n', '<leader>trn', '<cmd>set rnu!<CR>', { desc = 'Toggle relative number' })

-- Navigate Open Buffers
map('n', '<leader>x', ':bd<CR>', { desc = 'buffer close' })
map('n', '<tab>', ':bn<CR>', { desc = 'buffer goto next' })
map('n', '<S-tab>', ':bp<CR>', { desc = 'buffer goto previous' })

-- Navigate Open Tabs
map('n', '<C-z>', ':tabclose<CR>', { desc = 'Tab close' })
map('n', '<C-n>', ':tabnew<CR>', { desc = 'Tab create' })
map('n', '<S-C-j>', ':tabnext<CR>', { desc = 'Tab goto next' })
map('n', '<S-C-k>', ':tabprevious<CR>', { desc = 'Tab goto previous' })

-- Persistence Keybinds
map('n', '<leader>oS', require('persistence').load, { desc = 'Load the session for the current directory' })
map('n', '<leader>os', require('persistence').select, { desc = 'Select a session to load' })
map('n', '<leader>ol', function()
  require('persistence').load { last = true }
end, { desc = 'Load the last session' })
map('n', '<leader>od', require('persistence').stop, { desc = "Stop persistence session | Won't be saved on exit" })

-- Snacks scratch keymaps
map('n', '<leader>ts', require('snacks').scratch.open, { desc = 'Toggle scratch buffer instance' })
map('n', '<leader>sS', require('snacks').scratch.select, { desc = 'Select from scranch instances' })

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
