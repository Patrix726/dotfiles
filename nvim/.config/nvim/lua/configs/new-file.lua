---@module "snacks"
---
local Path = require 'plenary.path'
local M = {}

-- Collect directories (pure Lua, no fd dependency), show relative labels
local function collect_dirs()
  local cwd = vim.loop.cwd()
  local items = { { text = '/', value = cwd } }

  -- Get all subdirs recursively; returns absolute paths when cwd is given
  local dirs = vim.fn.globpath(cwd, '**/', false, true)

  for _, abs in ipairs(dirs) do
    -- Skip the cwd itself and .git
    if abs ~= (cwd .. '/') and not abs:find '/%.git/' and not abs:find '/%node_modules/' then
      local rel = abs:gsub('^' .. vim.pesc(cwd) .. '/?', ''):gsub('/$', '')
      table.insert(items, { text = rel, value = abs:gsub('/$', '') })
    end
  end

  return items
end

function M.create_path_in_folder()
  local items = collect_dirs()

  Snacks.picker.select(items, {
    title = 'Select Folder',
    format_item = function(item)
      return item.text
    end,
  }, function(item)
    local base_dir = (item and item.value)
    if not base_dir or base_dir == '' then
      return
    end

    Snacks.input({ prompt = 'Enter new path: ' }, function(input)
      if not input or input == '' then
        return
      end

      local new_path = Path:new(base_dir .. '/' .. input)

      -- treat trailing slash as "make directory"
      if input:sub(-1) == '/' then
        new_path:mkdir { parents = true }
        Snacks.notify.info('Created folder: ' .. new_path.filename)
        vim.cmd('edit ' .. new_path.filename)
      else
        new_path:parent():mkdir { parents = true }
        if not new_path:exists() then
          new_path:touch { parents = true }
          Snacks.notify.info('Created file: ' .. new_path.filename)
        else
          Snacks.notify.warn('File already exists: ' .. new_path.filename)
        end
        vim.cmd('edit ' .. new_path.filename)
      end
    end)
  end)
end

return M
