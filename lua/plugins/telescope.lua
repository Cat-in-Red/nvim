return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
	config = function() 
		require('telescope').setup(
		{

			pickers = {
				find_files = {
					hidden = true
				},
				live_grep = {
					file_ignore_patterns = { 'node_modules', '.git', '.venv' },
						additional_args = function(_)
							return { "--hidden" }
						end
                },
			},
			extensions = {
				workspaces = {
				-- keep insert mode after selection in the picker, default is false
				keep_insert = true,
				-- Highlight group used for the path in the picker, default is "String"
				path_hl = "String"
				}
			}

		})
		require('telescope').load_extension('workspaces')
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
		vim.keymap.set('n', '<leader>fw', require('telescope').extensions.workspaces.workspaces, { desc = 'Telescope workspaces' })
	end
}
