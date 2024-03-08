
-- toggle relative line numbers
vim.keymap.set(
  'n', '<leader>l',
  function()
   vim.wo.number=true
    vim.wo.relativenumber = not vim.wo.relativenumber
  end,
  {silent=true, desc= 'toggle relative line numbers' }
)

-- toggle line numbers and line indent
vim.keymap.set( 'n', '<leader>L',
  function()
    vim.wo.relativenumber=false -- TODO: if relative line numbers was on then it should be on on retoggle -> global variable
    vim.wo.number = not vim.wo.number
    -- vim.cmd('IndentBlanklineToggle')
    vim.cmd('Gitsigns toggle_signs')
  end,
  {silent=true, desc='hide line numbers'})

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
