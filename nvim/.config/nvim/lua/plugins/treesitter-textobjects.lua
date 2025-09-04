return {
  'nvim-treesitter/nvim-treesitter-textobjects',
  enabled = true,
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('nvim-treesitter.configs').setup {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },

      textobjects = {
        -- syntax-aware textobjects
        enable = true,
        keymaps = {
          -- ["iL"] = {
          --   -- you can define your own textobjects directly here
          --   go = "(function_definition) @function",tree
          -- },
          -- or you use the queries from supported languages with textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['aC'] = '@class.outer',
          ['iC'] = '@class.inner',
          ['ac'] = '@conditional.outer',
          ['ic'] = '@conditional.inner',
          ['ae'] = '@block.outer',
          ['ie'] = '@block.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['is'] = '@statement.inner',
          ['as'] = '@statement.outer',
          ['am'] = '@call.outer',
          ['im'] = '@call.inner',
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']c'] = '@conditional.outer',
            [']p'] = '@loop.outer',
            [']f'] = '@function.outer',
            -- ["]m"] = "@function.outer",
            -- ["]]"] = "@class.outer",
          },
          goto_next_end = {
            [']C'] = '@conditional.outer',
            [']P'] = '@loop.outer',
            [']F'] = '@function.outer',
            -- ["]M"] = "@function.outer",
            -- ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ['[c'] = '@conditional.outer',
            ['[p'] = '@loop.outer',
            ['[f'] = '@function.outer',
            -- ["[m"] = "@function.outer",
            -- ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ['[C'] = '@conditional.outer',
            ['[P'] = '@loop.outer',
            ['[F'] = '@function.outer',
            -- ["[M"] = "@function.outer",
            -- ["[]"] = "@class.outer",
          },
        },
        select = {
          enable = true,
          selection_modes = {
            ['@function.outer'] = 'V', -- linewise
          },
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['aC'] = '@class.outer',
            ['iC'] = '@class.inner',
            ['ac'] = '@conditional.outer',
            ['ic'] = '@conditional.inner',
            ['ae'] = '@block.outer',
            ['ie'] = '@block.inner',
            ['al'] = '@loop.outer',
            ['il'] = '@loop.inner',
            ['am'] = '@call.outer',
            ['im'] = '@call.inner',
            -- Or you can define your own textobjects like this
          },
        },
      },
    }
  end,
}
