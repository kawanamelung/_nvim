vim.keymap.set("n", "<leader>f", function()
	require("oil").open(".")
	vim.opt.colorcolumn = ""
end, { desc = "toggle oil tree" })

-- toggle relative line numbers
vim.keymap.set("n", "<leader>l", function()
	vim.wo.number = true
	vim.wo.relativenumber = not vim.wo.relativenumber
end, { silent = true, desc = "toggle relative [l]ine numbers" })

-- Command to toggle inline diagnostics
vim.api.nvim_create_user_command("DiagnosticsToggleVirtualText", function()
	local current_value = vim.diagnostic.config().virtual_text
	if current_value then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({ virtual_text = true })
	end
end, {})

-- toggle diagnostics
vim.keymap.set("n", "<leader>dd", ":DiagnosticsToggle<CR>", { silent = true, desc = "toggle [d]iagnostics" })

-- Command to toggle diagnostics
vim.api.nvim_create_user_command("DiagnosticsToggle", function()
	local current_value = vim.diagnostic.is_disabled()
	if current_value then
		vim.diagnostic.enable()
	else
		vim.diagnostic.disable()
	end
end, {})

-- toggle line numbers, line indent, and diagnostics
vim.keymap.set("n", "<leader>L", function()
	vim.wo.relativenumber = false -- TODO: if relative line numbers was on then it should be on on retoggle -> global variable
	vim.wo.number = not vim.wo.number
	-- vim.cmd('IndentBlanklineToggle')
	vim.cmd("Gitsigns toggle_signs")
	vim.cmd("DiagnosticsToggle")
end, { silent = true, desc = "hide line numbers" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vim: ts=2 sts=2 sw=2 et
