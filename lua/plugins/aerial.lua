return {
    'stevearc/aerial.nvim',
    opts = {
      on_attach = function()
        vim.keymap.set('n', '<tab>', '<cmd>AerialToggle<CR>')
      end,
      close_on_select = true,
      autojump = true
    },
    -- Optional dependencies
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
}
