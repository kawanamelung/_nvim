return {
  {
    'ThePrimeagen/harpoon',
    config = function()
      require('telescope').load_extension 'harpoon'
      vim.keymap.set('n', '<leader>a', require('harpoon.mark').add_file, { desc = 'add file to harpoon' })
      vim.keymap.set('n', '<leader>h', require('harpoon.ui').toggle_quick_menu, { desc = 'show harpoon list' })
      for i = 1, 9 do
        vim.api.nvim_set_keymap(
          'n',
          '<leader>' .. i,
          ':lua require("harpoon.ui").nav_file(' .. i .. ')<CR>',
          { noremap = true, silent = true, desc = 'navigate to harpoon file ' .. i }
        )
      end
    end,
  },
}
