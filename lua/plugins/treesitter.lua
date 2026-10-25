return {
	{
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = {"java", "dockerfile", "bash", "nginx", "yaml", "php"},
				auto_install = true,
				highlight = {
					enable = true,
				}
			})
		end
	}
}
