-----------------------------------------------------------------------------
-- TODO:
------------------------------------------------------------------------------
-- repeating recordings
-- and ]m ]] ]M etc.
-- "danymat/neogen" for doc generation
-- jupyter_ascending/jupynium.nvim/quarto-nvim
-- nvim.substitute
-------------------------------------------------------------------------------

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true


-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- [[ Complex Keymaps]]
require 'keymaps_with_functions'

-- [[ Vim Settings ]]
require 'settings'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
