-- Install `lazy.nvim` plugin manager ]]
-- See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- To check the current status of your plugins, run
--   :Lazy
--
-- You can press `?` in this menu for help. Use `:q` to close the window
--
-- To update plugins, you can run
--   :Lazy update

-- Use `opts = {}` to force a plugin to be loaded.
require("lazy").setup({
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	-- file swapping
	{ "ThePrimeagen/harpoon" },

	-- "gc" to comment visual regions/lines
	{ "numToStr/Comment.nvim", opts = {} }, -- Use `opts = {}` to force a plugin to be loaded.

	{
		"lukas-reineke/virt-column.nvim",
		config = true,
		exclude = {
			filetypes = {
				"python",
			},
		},
	},

	-- vim-like file tree for navigation and editing
	require("plugins/oil"),

	require("plugins/gitsigns"),

	require("plugins/which-key"),

	require("plugins/telescope"),

	require("plugins/lspconfig"),

	require("plugins/conform"),

	require("plugins/cmp"),

	require("plugins/tokyonight"),

	require("plugins/todo-comments"),

	require("plugins/mini"),

	require("plugins/treesitter"),

	-- require 'kickstart.plugins.debug',
	-- require 'kickstart.plugins.indent_line',
}, {
	ui = {
		-- If you have a Nerd Font, set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
