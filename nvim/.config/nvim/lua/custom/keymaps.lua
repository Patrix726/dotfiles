require 'custom.term'

local map = vim.keymap.set

local toggleBufferLine = function()
  local hidden = vim.opt.showtabline:get() == 0
  if hidden then
    vim.opt.showtabline = 1
  else
    vim.opt.showtabline = 0
  end
end

-- Remove the Enter remap in the quickfix window
vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Remap enter to default in quickfix windows',
  group = vim.api.nvim_create_augroup('quickfix-remap', { clear = true }),
  callback = function()
    vim.cmd [[autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>]]
  end,
})

-- map ctrl + hjkl to movement in insert mode
-- map('i', '<C-h>', '', { desc = 'Move left in insert mode' })
-- map('i', '<C-j>', '', { desc = 'Move down in insert mode' })
-- map('i', '<C-k>', '', { desc = 'Move up in insert mode' })
-- map('i', '<C-l>', '', { desc = 'Move right in insert mode' })

-- Search and replace
map('n', '<leader>ra', function()
  local search_term = vim.fn.getreg '/'
  local replace_term = vim.fn.input("Replace '" .. search_term .. "' with: ")
  vim.cmd(':%s/' .. search_term .. '/' .. replace_term .. '/g')
end, { desc = 'Substitute last searched word with input' })

map('n', '<leader>rs', function()
  local search_term = vim.fn.getreg '/'
  local replace_term = vim.fn.input("Replace '" .. search_term .. "' with: ")
  vim.cmd(':%s/' .. search_term .. '/' .. replace_term .. '/gc')
end, { desc = 'Substitute last searched word with input with confirmation' })

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('n', ',', ';', { desc = 'Repeat last f or t command' })
map('n', ':', ',', { desc = 'Execute the inverse of the last f or t command' })
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
map('n', 'U', '<C-r>', { desc = 'Redo key' })
map('i', 'jk', '<ESC>')
map('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
map('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
map('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
map('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
map('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
map('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
map('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
map('n', '`', 'q', { desc = 'Start macro recording' })
map('n', 'q', 'b', { desc = 'One word back' })
map('n', 'b', '%', { desc = 'Complimenting bracket' })
map('n', '<leader>gi', ':Neogit<CR>', { noremap = true, desc = 'Open Neogit dashboard' })
map('n', '<C-S>', ':w<CR>', { desc = 'Save file' })
map('n', '<leader>ty', ':Themery<CR>', { desc = 'Select theme' })
map('n', '<leader>wk', ':WhichKey<CR>', { desc = 'Open WhichKey dialog' })
map('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })
map({ 'n', 't' }, '<A-h>', ToggleTerminal, { desc = 'Toggle terminal', noremap = true })
-- map('n', '<leader>trn', '<cmd>set rnu!<CR>', { desc = 'Toggle relative number' })
map('n', '<leader>trn', '<cmd>ComfyLineNumbers toggle<CR>', { desc = 'Toggle relative number' })

-- Navigate Open Buffers
map('n', '<leader>x', ':bd<CR>', { desc = 'buffer close' })
map('n', '<tab>', ':bn<CR>', { desc = 'buffer goto next' })
map('n', '<S-tab>', ':bp<CR>', { desc = 'buffer goto previous' })

-- Navigate Open Tabs
map('n', '<C-x>', ':tabclose<CR>', { desc = 'Tab close' })
map('n', '<C-n>', ':tabnew<CR>', { desc = 'Tab create' })
map('n', '<C-j>', ':tabnext<CR>', { desc = 'Tab goto next' })
map('n', '<C-k>', ':tabprevious<CR>', { desc = 'Tab goto previous' })

-- Toggle bufferline
map('n', '<leader>tl', toggleBufferLine, { desc = 'Toggle bufferline' })
map({ 'n', 'v' }, '<leader>tv', require('nvim-toggler').toggle, { desc = 'Toggle value' })

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

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
-- map({ "n", "x", "o" }, ":", ts_repeat_move.repeat_last_move_next)
-- map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
local ts_repeat_move = require 'nvim-treesitter.textobjects.repeatable_move'

-- vim way: ; goes to the direction you were moving.
map({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move, { desc = 'Next textobject forward' })
map({ 'n', 'x', 'o' }, ':', ts_repeat_move.repeat_last_move_opposite, { desc = 'Next textobject opposite' })

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
-- map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
-- map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
-- map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
-- map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

-- TreeSJ keymaps
map('n', '<leader>j', require('treesj').toggle)

-- -- For extending default preset with `recursive = true`
-- map('n', '<leader>M', function()
--     require('treesj').toggle({ split = { recursive = true } })
-- end)
