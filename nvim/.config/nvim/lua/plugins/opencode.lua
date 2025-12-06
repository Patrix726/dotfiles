return {
  'NickvanDyke/opencode.nvim',
  enabled = true,
  dependencies = { 'folke/snacks.nvim' },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`
    }

    -- Required for `opts.auto_reload`
    vim.opt.autoread = true
  end,
  -- stylua: ignore
  keys = {
    { '<leader>oa', function() require('opencode').ask("@this: ", { submit = true }) end, desc = 'Opencode: Ask', mode = { "n", "x" }, },
    { '<leader>ot', function() require('opencode').toggle() end, desc = 'Opencode: Toggle', mode = { "n", "t" }},
    -- { '<leader>oa', function() require('opencode').ask('@selection: ') end, desc = 'Opencode: Ask about selection', mode = 'v', },
    { '<leader>op', function() require('opencode').select() end, desc = 'Opencode: Select prompt', mode = { 'n', 'v', }, },
    { "<leader>od", function() require("opencode").prompt("@this") end, { desc = "Opencode: Add to opencode" } ,mode = { "n", "x" }},
    { '<leader>on', function() require('opencode').command('session_new') end, desc = 'Opencode: New session', },
    { '<leader>oy', function() require('opencode').command('messages_copy') end, desc = 'Opencode: Copy last message', },
    { '<S-C-u>',    function() require('opencode').command('session.half.page.up') end, desc = 'Opencode: Scroll messages up', },
    { '<S-C-d>',    function() require('opencode').command('session.half.page.down') end, desc = 'Opencode: Scroll messages down', },
  },
}
