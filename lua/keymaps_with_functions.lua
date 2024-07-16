-- vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
-- require('Undotree').load 'wave'
-- g:undotree_WindowLayout = 1
local group = vim.api.nvim_create_augroup('jump_last_position', { clear = true })
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
    if { row, col } ~= { 0, 0 } then
      vim.api.nvim_win_set_cursor(0, { row, 0 })
    end
  end,
  group = group,
})

-- Remove whitespace on save
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  pattern = { '*' },
  callback = function()
    local save_cursor = vim.fn.getpos '.'
    vim.cmd [[%s/\s\+$//e]]
    vim.fn.setpos('.', save_cursor)
  end,
})
-- Oil at workspace directory
vim.keymap.set('n', '<leader>f', function()
  require('oil').open '.'
  vim.opt.colorcolumn = ''
end, { desc = 'toggle oil tree' })

vim.keymap.set('n', '<leader>F', function()
  local current_file = vim.fn.expand '%:p' -- Get the full path of the current file
  local current_dir = vim.fn.fnamemodify(current_file, ':h') -- Get the directory of the current file
  require('oil').open(current_dir)
  vim.opt.colorcolumn = ''
end, { desc = 'toggle oil tree' })

-- toggle relative line numbers
vim.keymap.set('n', '<leader>l', function()
  vim.wo.number = true
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { silent = true, desc = 'toggle relative [l]ine numbers' })

-- Command to toggle inline diagnostics
vim.api.nvim_create_user_command('DiagnosticsToggleVirtualText', function()
  local current_value = vim.diagnostic.config().virtual_text
  if current_value then
    vim.diagnostic.config { virtual_text = false }
  else
    vim.diagnostic.config { virtual_text = true }
  end
end, {})

-- toggle diagnostics
vim.keymap.set('n', '<leader>dd', ':DiagnosticsToggle<CR>', { silent = true, desc = 'toggle [d]iagnostics' })

-- Command to toggle diagnostics
vim.api.nvim_create_user_command('DiagnosticsToggle', function()
  local current_value = vim.diagnostic.is_disabled()
  if current_value then
    vim.diagnostic.enable()
  else
    vim.diagnostic.disable()
  end
end, {})

-- toggle line numbers, line indent, and diagnostics
vim.keymap.set('n', '<leader>L', function()
  vim.wo.relativenumber = false -- TODO: if relative line numbers was on then it should be on on retoggle -> global variable
  vim.wo.number = not vim.wo.number
  -- vim.cmd('IndentBlanklineToggle')
  vim.cmd 'Gitsigns toggle_signs'
  vim.cmd 'DiagnosticsToggle'
end, { silent = true, desc = 'hide line numbers' })

-- lazygit
vim.keymap.set('n', 'lg', function()
  vim.cmd 'LazyGit'
end, { desc = 'open LazyGit' })

-- lazygit but with leader
vim.keymap.set('n', '<leader>lg', function()
  vim.cmd 'LazyGit'
end, { desc = 'open LazyGit' })

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
