-----------------------------------------------------------------------------
-- IDEAS AND TODOS
------------------------------------------------------------------------------
-- add spell check
-- repeating recordings
-- and ]m ]] ]M etc.
-- paste over text but keep paste -> registers?
-- fix TODO highlighting -> check highlight groups
-- check the byfwritepre autocmd
-- How to disbale the lsp float (left side bar and right float)
-- nvim lir
-------------------------------------------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Vim settings ]]
require("settings")

-- [[ Configure and install plugins ]]
require("lazy-plugins")

-- [[ Basic Keymaps ]]
require("keymaps")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
