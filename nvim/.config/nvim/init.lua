vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

if vim.g.vscode then
 -- VSCODE Neovim
  require "vscode_configs/vscode_mappings"
  require "vscode_configs/vscode_options"
else
  -- bootstrap lazy and all plugins
  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazypath) then
    local repo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
  end

  vim.opt.rtp:prepend(lazypath)

  local lazy_config = require "configs.lazy"

  -- load plugins
  require("lazy").setup({
    {
      "NvChad/NvChad",
      lazy = false,
      branch = "v2.5",
      import = "nvchad.plugins",
      config = function()
        require "options"
      end,
    },

    { import = "plugins" },
  }, lazy_config)

  -- require("hardtime").setup()

  require('code_runner').setup({
    filetype = {
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt"
      },
      python = "python3 -u",
      typescript = "deno run",
      rust = {
        "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt"
      },
      c = function(...)
        c_base = {
          "cd $dir &&",
          "gcc $fileName -o",
          "/tmp/$fileNameWithoutExt",
        }
        local c_exec = {
          "&& /tmp/$fileNameWithoutExt &&",
          "rm /tmp/$fileNameWithoutExt",
        }
        vim.ui.input({ prompt = "Add more args:" }, function(input)
          c_base[4] = input
          vim.print(vim.tbl_extend("force", c_base, c_exec))
          require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
        end)
      end,
    },
  })

  -- load theme
  dofile(vim.g.base46_cache .. "defaults")
  dofile(vim.g.base46_cache .. "statusline")

  require "nvchad.autocmds"

  vim.schedule(function()
    require "mappings"
  end)
end
