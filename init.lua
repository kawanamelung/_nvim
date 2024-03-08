-----------------------------------------------------------------------------
-- IDEAS AND TODOS
------------------------------------------------------------------------------
-- add spell check
-- repeating recordings
-- and ]m ]] ]M etc.
-- paste over text but keep paste -> registers?
-- "danymat/neogen" for doc generation
-- add lazy git
-------------------------------------------------------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Vim settings ]]
require 'settings'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- [[ Complex Keymaps]]
require 'keymaps_with_functions'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
