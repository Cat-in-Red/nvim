return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- local lspconfig = vim.lsp.config
			-- -- lspconfig.bashls.setup({})
			-- lspconfig.ansiblels.setup({
			--   filetype = { "yaml.ansible" },
			--   settings = {
			-- 	ansible = {
			-- 	  ansible = {
			-- 		path = "ansible",  -- путь к бинарнику ansible
			-- 	  },
			-- 	  python = {
			-- 		interpreterPath = "python3",  -- или путь к твоему venv
			-- 	  },
			-- 	  validation = {
			-- 		enabled = true,
			-- 		lint = {
			-- 		  enabled = true,
			-- 		  path = "ansible-lint",  -- если установлен ansible-lint
			-- 		},
			-- 	  },
			-- 	},
			--   },

			-- }
			vim.lsp.config('pyright', {})
			vim.lsp.config('bashls', {})
			vim.lsp.config('dockerls', {})
			vim.lsp.config('lua_ls', {})
			vim.lsp.config('docker_compose_language_service', {})
			vim.lsp.config('gitlab_ci_ls', {})
			vim.lsp.config('terraformls', {})
			vim.lsp.config('ansiblels', {
			  settings = {
				ansible = {
				  ansible = {
					path = "ansible",  -- путь к бинарнику ansible
				  },
				  python = {
					interpreterPath = "python3",  -- или путь к твоему venv
				  },
				  validation = {
					enabled = true,
					lint = {
					  enabled = true,
					  path = "ansible-lint",  -- если установлен ansible-lint
					},
				  },
				},
			  },
			})
			vim.lsp.config('yamlls', {
			  settings = {
				yaml = {
				  schemaStore = {
					enable = true,
					url = "https://www.schemastore.org/api/json/catalog.json",
				  },
				},
			  },
			})

			-- lspconfig.pyright.setup({})
			-- lspconfig.dockerls.setup({})
			-- lspconfig.lua_ls.setup({})
			-- lspconfig.docker_compose_language_service.setup({})
			-- lspconfig.gitlab_ci_ls.setup({})
			-- lspconfig.ansiblels.setup({})
			-- lspconfig.terraformls.setup({})
			-- lspconfig.yamlls.setup({
			--   settings = {
			-- 	yaml = {
			-- 	  schemaStore = {
			-- 		enable = true,
			-- 		url = "https://www.schemastore.org/api/json/catalog.json",
			-- 	  },
			-- 	},
			--   },
			-- })
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover" })
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = ev.buf, desc = "Go to implementation" })
					vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = ev.buf, desc = "Go to references" })
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
					vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, { buffer = ev.buf, desc = "Type definition" })
					vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename Symbol" })
					vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Action" })
					vim.keymap.set("n", "<Leader>lf", function()
						vim.lsp.buf.format({ async = true })
					end, { buffer = ev.buf, desc = "Autoformating" })
				end,
			})
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "*.gitlab-ci*.{yml,yaml}",
				callback = function()
					vim.bo.filetype = "yaml.gitlab"
				end,
			})
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "docker-{compose,stack}*.{yml,yaml}",
				callback = function()
					vim.bo.filetype = "yaml.docker-compose"
				end,
			})
			vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
				pattern = "Dockerfile.*",
				callback = function()
					vim.bo.filetype = "dockerfile"
				end,
			})
			vim.api.nvim_create_autocmd({"BufWritePre"}, {
				pattern = {"*.tf", "*.tfvars"},
				callback = function()
					vim.lsp.buf.format()
				end,
			})
			vim.filetype.add({
				extension = {
					puml = "plantuml",
					plantuml = "plantuml",
				},
			})

		end
	}
}
