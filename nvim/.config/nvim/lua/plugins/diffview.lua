return {
  'sindrets/diffview.nvim',
  event = 'VeryLazy',
  opts = {
    view = {
      merge_tool = {
        -- Config for conflicted files in diff views during a merge or rebase.
        layout = 'diff3_mixed',
        disable_diagnostics = false, -- Temporarily disable diagnostics for diff buffers while in the view.
        winbar_info = true, -- See |diffview-config-view.x.winbar_info|
      },
    },
  },
}
