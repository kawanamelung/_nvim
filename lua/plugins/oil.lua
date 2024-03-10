return {
  {
    'stevearc/oil.nvim',
    opts = {
      columns = {
        -- "icon",
        -- "size",
      },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ['q'] = 'actions.close',
      },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
}
