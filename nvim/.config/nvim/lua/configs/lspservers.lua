return {
  -- LSPs
  --
  -- ts_ls = {
  --   root_dir = function(...)
  --     return require('lspconfig.util').root_pattern '.git'(...)
  --   end,
  --   single_file_support = false,
  --   settings = {
  --     typescript = {
  --       inlayHints = {
  --         includeInlayParameterNameHints = 'literal',
  --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --         includeInlayFunctionParameterTypeHints = true,
  --         includeInlayVariableTypeHints = false,
  --         includeInlayPropertyDeclarationTypeHints = true,
  --         includeInlayFunctionLikeReturnTypeHints = true,
  --         includeInlayEnumMemberValueHints = true,
  --       },
  --     },
  --     javascript = {
  --       inlayHints = {
  --         includeInlayParameterNameHints = 'all',
  --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --         includeInlayFunctionParameterTypeHints = true,
  --         includeInlayVariableTypeHints = true,
  --         includeInlayPropertyDeclarationTypeHints = true,
  --         includeInlayFunctionLikeReturnTypeHints = true,
  --         includeInlayEnumMemberValueHints = true,
  --       },
  --     },
  --   },
  -- },
  --
  vtsls = {
    --- @type lspconfig.settings.vtsls
    settings = {
      typescript = {},
    },
    experimental = {
      completion = {
        enableServerSideFuzzyMatch = true,
        entriesLimit = 50,
      },
    },
  },
  tsgo = {},
  postgres_lsp = {},
  -- ts_go_ls = {
  --   cmd = { vim.loop.os_homedir() .. '/dev/typescript-go/built/local/tsgo', 'lsp', '-stdio' },
  --   filetypes = {
  --     'javascript',
  --     'javascriptreact',
  --     'javascript.jsx',
  --     'typescript',
  --     'typescriptreact',
  --     'typescript.tsx',
  --   },
  --   root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
  -- },
  bashls = {},
  shellcheck = {},
  svelte = {},
  basedpyright = {},
  tailwindcss = {},
  cssls = {},
  html = {},
  emmet_language_server = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  prismals = {},
  tinymist = {},

  -- Formatters
  prettierd = {},
  prettier = {},
  isort = {},
  black = {},
  stylua = {},

  -- Linters
  eslint_d = {},
  eslint = {},
  markdownlint = {},

  -- DAP
  -- js_debug_adapter = {},
}
