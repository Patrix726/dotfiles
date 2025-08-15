return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  config = function()
    -- Custom Lualine component to show attached language server
    local clients_lsp = function()
      local bufnr = vim.api.nvim_get_current_buf()

      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return ''
      end

      local c = {}
      for _, client in pairs(clients) do
        table.insert(c, client.name)
      end
      return ' ' .. table.concat(c, '|')
    end
    --
    -- local custom_tokyonight = require 'lualine.themes.tokyonight-night'
    --
    -- -- Custom colours
    -- custom_tokyonight.normal.b.fg = '#cad3f5'
    -- custom_tokyonight.insert.b.fg = '#cad3f5'
    -- custom_tokyonight.visual.b.fg = '#cad3f5'
    -- custom_tokyonight.replace.b.fg = '#cad3f5'
    -- custom_tokyonight.command.b.fg = '#cad3f5'
    -- custom_tokyonight.inactive.b.fg = '#cad3f5'
    --
    -- custom_tokyonight.normal.c.fg = '#6e738d'
    -- custom_tokyonight.normal.c.bg = '#1e2030'
    --
    require('lualine').setup {
      options = {
        -- theme = custom_tokyonight,
        theme = 'auto',
        component_separators = '',
        -- section_separators = { left = ' ', right = ' ' },
        disabled_filetypes = { 'alpha', 'Outline' },
      },
      sections = {
        lualine_a = {
          { 'mode', separator = { left = '', right = '' }, icon = '', padding = { left = 1, right = 1 } },
        },
        lualine_b = {},
        lualine_c = {
          {
            'branch',
            icon = '',
          },
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            colored = false,
          },
        },
        lualine_x = {
          {
            'diagnostics',
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            update_in_insert = true,
          },
        },
        lualine_y = {
          {
            'filetype',
            icon_only = true,
            padding = { left = 1, right = 0 },
          },
          'filename',
        },
        lualine_z = {
          { 'location', separator = { left = '', right = '' } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      extensions = { 'toggleterm', 'trouble' },
    }
  end,
}
-- --
-- -- lualine.lua
-- --
-- -- Custom status line
-- --
--
-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	event = "VeryLazy",
-- 	config = function()
-- 		-- Custom Lualine component to show attached language server
-- 		local clients_lsp = function()
-- 			local bufnr = vim.api.nvim_get_current_buf()
--
-- 			local clients = vim.lsp.get_clients()
-- 			if next(clients) == nil then
-- 				return ""
-- 			end
--
-- 			local c = {}
-- 			for _, client in pairs(clients) do
-- 				table.insert(c, client.name)
-- 			end
-- 			return " " .. table.concat(c, "|")
-- 		end
--
-- 		local custom_catppuccin = require("lualine.themes.catppuccin")
--
-- 		-- Custom colours
-- 		custom_catppuccin.normal.b.fg = "#cad3f5"
-- 		custom_catppuccin.insert.b.fg = "#cad3f5"
-- 		custom_catppuccin.visual.b.fg = "#cad3f5"
-- 		custom_catppuccin.replace.b.fg = "#cad3f5"
-- 		custom_catppuccin.command.b.fg = "#cad3f5"
-- 		custom_catppuccin.inactive.b.fg = "#cad3f5"
--
-- 		custom_catppuccin.normal.c.fg = "#6e738d"
-- 		custom_catppuccin.normal.c.bg = "#1e2030"
--
-- 		require("lualine").setup({
-- 			options = {
-- 				theme = custom_catppuccin,
-- 				component_separators = "",
-- 				section_separators = { left = "", right = "" },
-- 				disabled_filetypes = { "alpha", "Outline" },
-- 			},
-- 			sections = {
-- 				lualine_a = {
-- 					{ "mode", separator = { left = " ", right = "" }, icon = "" },
-- 				},
-- 				lualine_b = {
-- 					{
-- 						"filetype",
-- 						icon_only = true,
-- 						padding = { left = 1, right = 0 },
-- 					},
-- 					"filename",
-- 				},
-- 				lualine_c = {
-- 					{
-- 						"branch",
-- 						icon = "",
-- 					},
-- 					{
-- 						"diff",
-- 						symbols = { added = " ", modified = " ", removed = " " },
-- 						colored = false,
-- 					},
-- 				},
-- 				lualine_x = {
-- 					{
-- 						"diagnostics",
-- 						symbols = { error = " ", warn = " ", info = " ", hint = " " },
-- 						update_in_insert = true,
-- 					},
-- 				},
-- 				lualine_y = { clients_lsp },
-- 				lualine_z = {
-- 					{ "location", separator = { left = "", right = " " }, icon = "" },
-- 				},
-- 			},
-- 			inactive_sections = {
-- 				lualine_a = { "filename" },
-- 				lualine_b = {},
-- 				lualine_c = {},
-- 				lualine_x = {},
-- 				lualine_y = {},
-- 				lualine_z = { "location" },
-- 			},
-- 			extensions = { "toggleterm", "trouble" },
-- 		})
-- 	end,
-- }
-- return {
--   'nvim-lualine/lualine.nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   config = function()
--     require('lualine').setup {
--       options = {
--         icons_enabled = true,
--         theme = 'auto',
--         component_separators = '',
--         section_separators = { left = '', right = '' },
--         disabled_filetypes = {
--           statusline = {},
--           winbar = {},
--         },
--         ignore_focus = {},
--         always_divide_middle = true,
--         always_show_tabline = true,
--         globalstatus = false,
--         refresh = {
--           statusline = 1000,
--           tabline = 1000,
--           winbar = 1000,
--           refresh_time = 16, -- ~60fps
--           events = {
--             'WinEnter',
--             'BufEnter',
--             'BufWritePost',
--             'SessionLoadPost',
--             'FileChangedShellPost',
--             'VimResized',
--             'Filetype',
--             'CursorMoved',
--             'CursorMovedI',
--             'ModeChanged',
--           },
--         },
--       },
--       sections = {
--         lualine_a = { 'mode' },
--         lualine_b = { 'branch', 'diff', 'diagnostics' },
--         lualine_c = { 'filename' },
--         lualine_x = { 'filetype' },
--         lualine_y = { 'progress' },
--         lualine_z = { 'location' },
--       },
--       inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = { 'filename' },
--         lualine_x = { 'location' },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       tabline = {},
--       winbar = {},
--       inactive_winbar = {},
--       extensions = {},
--     }
--   end,
-- }
