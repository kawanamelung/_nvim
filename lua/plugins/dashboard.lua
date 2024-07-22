return {{
    'nvimdev/dashboard-nvim',
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
      local function get_python_stdout(command)
        -- Open a pipe to the command
        local handle = io.popen(command)
        -- Read the output
        local result = handle:read '*a'

        -- Close the handle
        handle:close()
        return result
      end

      local python_command = 'neovim_trees.py'

      local result = get_python_stdout(python_command)

      local opts = {
        hide = {
          statusline = false,
        },
        config = {
          shortcut = {
            -- action can be a function type
            -- { desc = '[  kawanamelung]', group = 'DashboardShortCut', key = 'g', action = ':lua open_github()<CR>' },
          },
          header = vim.split(result, '\n'),
          project = { enable = false, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
          mru = { limit = 5, icon = 'Recent files', label = '', cwd_only = false },
          footer = {}, -- footer
        },
      }

      return opts
    end,
},
}
