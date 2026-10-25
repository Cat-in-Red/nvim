return {
	{
		"natecraddock/sessions.nvim",
		config = function()
			require('sessions').setup(
			{
				session_filepath = vim.fn.stdpath("data") .. "/sessions",
				absolute = true,
			})
		end
	},

	{
		"natecraddock/workspaces.nvim",
		config = function()
			require("workspaces").setup(
			{
				hooks = {
					open_pre = {
					  -- If recording, save current session state and stop recording
					  "SessionsSave",

					  -- delete all buffers (does not save changes)
					  "silent %bdelete!",
					},
					open = function()
					  require("sessions").load(nil, { silent = true })
					  -- require("neo-tree.command").execute({ toggle = true }) 
					end,
				}
			})
		end
	}
}
