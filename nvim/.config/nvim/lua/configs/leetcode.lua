local M = {}

local format_commit_message = function(filename)
  -- Split by "."
  local parts = {}
  for part in filename:gmatch '[^%.]+' do
    table.insert(parts, part)
  end

  if #parts < 2 then
    return filename -- fallback if unexpected
  end

  local number = parts[1]
  local middle = parts[2]

  -- Replace dashes with spaces & capitalize each word
  local formatted_middle = middle:gsub('-', ' '):gsub('(%a)(%w*)', function(first, rest)
    return first:upper() .. rest:lower()
  end)

  return number .. '. ' .. formatted_middle
end

M.move_and_git_commit = function()
  local destination_path = vim.fn.expand '$HOME/Documents/Code/CPD/Leetcode'
  local current_file = vim.fn.expand '%:p' -- full path to the current file

  if current_file == '' then
    print 'No file in current buffer.'
    return
  end

  -- Save before moving
  vim.cmd 'write'

  local filename = vim.fn.fnamemodify(current_file, ':t') -- just the filename
  local target_file = destination_path .. '/' .. filename

  -- Format commit message
  local commit_message = format_commit_message(filename)

  -- Ensure directory exists
  vim.fn.mkdir(destination_path, 'p')

  -- Move file
  local move_cmd = string.format("mv '%s' '%s'", current_file, target_file)
  vim.fn.system(move_cmd)

  -- Run git add & commit in the destination repo
  local git_add_cmd = string.format("cd '%s' && git add '%s'", destination_path, filename)
  local git_commit_cmd = string.format("cd '%s' && git commit -m '%s'", destination_path, commit_message)

  vim.fn.system(git_add_cmd)
  vim.fn.system(git_commit_cmd)

  vim.notify('Moved and committed ' .. filename)
end

return M
