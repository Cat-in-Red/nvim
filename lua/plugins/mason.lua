return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup(
			{
				ensure_installed = {
					"ansiblels",
					"bashls",
					"dockerls",
					"docker_compose_language_service",
					"pyright",
					-- "gitlab_ci_ls",
					"lua_ls",
					-- "terraformls",
					"yamlls"
				}
			})
		end
	}
}
