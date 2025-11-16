return {
  -- clangd = {},
  -- gopls = {},
  -- pyright = {},
  -- rust_analyzer = {},
  -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
  --
  -- Some languages (like typescript) have entire language plugins that can be useful:
  --    https://github.com/pmizio/typescript-tools.nvim
  --
  -- But for many setups, the LSP (`ts_ls`) will work just fine

  -- LSPs
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
    settings = {
      typescript = {
        inlayHints = {
          parameterNames = { enabled = 'all' },
          parameterTypes = { enabled = true },
          variableTypes = { enabled = true },
          propertyDeclarationTypes = { enabled = true },
          functionLikeReturnTypes = { enabled = true },
          enumMemberValues = { enabled = true },
        },
      },
    },
  },
  svelte = {},
  basedpyright = {},
  tailwindcss = {},
  cssls = {},
  html = {},
  emmet_language_server = {},
  lua_ls = {
    -- cmd = { ... },
    -- filetypes = { ... },
    -- capabilities = {},
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
  -- copilot = {},

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
